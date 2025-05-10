use std::fs::{self, File};
use std::io::{self, Write, BufRead, BufReader};
use std::path::Path;
use regex::Regex;

fn main() -> io::Result<()> {
    let mut output = File::create("training.jsonl")?;
    let re = Regex::new(r"//.*").unwrap();

    for entry in fs::read_dir("./training")? {
        let entry = entry?;
        let path = entry.path();
        
        if let Some(extension) = path.extension() {
            if extension == "qasm" {
                let file_name = path.file_name().unwrap().to_string_lossy();
                let file = File::open(&path)?;
                let reader = BufReader::new(file);
                let mut new_content = String::new();
                
                for line in reader.lines() {
                    let line = line?;
                    let cleaned_line = re.replace_all(&line, "").trim().to_string();
                    let cleaned_line= cleaned_line.replace("\"", "'") .to_string();
                    if !cleaned_line.is_empty() {
                        new_content.push_str(&cleaned_line);
                        new_content.push('\n');
                    }
                }

                let malicious = if file_name.contains("malicious") {
                    r#""content": "malicious""#
                } else {
                    r#""content": "benign""#
                };
                
                let escaped_content = new_content.replace("\n", "\\n");
                if escaped_content.len() > 10000 {
                    println!("Skipping {}: content too long", file_name);
                    continue;
                }
                writeln!(output, "{{ \"messages\": [{{\"role\": \"user\", \"content\": \"Classify this program as malicious or benign: {}\"}}, {{\"role\": \"assistant\", {}}}]}}", escaped_content, malicious)?;
                
                println!("Assembled {} to training.jsonl", file_name);
            } else {
                println!("Skipped {}", path.file_name().unwrap().to_string_lossy());
            }
        }
    }


    let mut output = File::create("validation.jsonl")?;
    let re = Regex::new(r"//.*").unwrap();

    for entry in fs::read_dir("./validation")? {
        let entry = entry?;
        let path = entry.path();
        
        if let Some(extension) = path.extension() {
            if extension == "qasm" {
                let file_name = path.file_name().unwrap().to_string_lossy();
                let file = File::open(&path)?;
                let reader = BufReader::new(file);
                let mut new_content = String::new();
                
                for line in reader.lines() {
                    let line = line?;
                    let cleaned_line = re.replace_all(&line, "").trim().to_string();
                    let cleaned_line= cleaned_line.replace("\"", "'") .to_string();
                    if !cleaned_line.is_empty() {
                        new_content.push_str(&cleaned_line);
                        new_content.push('\n');
                    }
                }

                let malicious = if file_name.contains("malicious") {
                    r#""is-malicious": "malicious""#
                } else {
                    r#""is-malicious": "benign""#
                };
                
                let escaped_content = new_content.replace("\n", "\\n");
                if escaped_content.len() > 10000 {
                    println!("Skipping {}: content too long", file_name);
                    continue;
                }
                writeln!(output, "{{ \"messages\": [{{\"role\": \"user\", \"content\": \"Classify this program as malicious or benign: {}\"}}, {{\"role\": \"assistant\", {}}}]}}", escaped_content, malicious)?;
                
                println!("Assembled {} to validation.jsonl", file_name);
            } else {
                println!("Skipped {}", path.file_name().unwrap().to_string_lossy());
            }
        }
    }

    Ok(())
}
