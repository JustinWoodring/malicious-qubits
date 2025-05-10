import os
from time import sleep
from mistralai import Mistral
import seaborn as sns
import pandas as pd
from sklearn.metrics import confusion_matrix
import matplotlib.pyplot as plt


api_key = "nU9NaUUooxhur2WV2aNug1quEK13Ye3D"

client = Mistral(api_key=api_key)

model = client.models.retrieve(
    model_id="ft:classifier:ministral-3b-latest:ca334848:20250429:6aa0dbf2"
)

y_true=[]
inputs = []
for filename in os.listdir("validation"):
    if filename.endswith(".qasm"):
        with open(os.path.join("validation", filename), "r") as file:
            read_file = file.read()
            escaped_string = read_file.replace("\n\n","\n").replace("\n", "\\n")
            if(len(escaped_string)<10000):
                y_true.append("malicious" if "malicious" in filename else "benign")
                inputs.append(escaped_string)

classifier_responses = [None] * len(inputs)
for i in range(len(inputs)):
    classifier_responses[i] = client.classifiers.classify(
        model=model.id,
        inputs=[inputs[i]]
    )
    print("sleeping")# S
    sleep(2)  

y_pred = []

for i in range(len(classifier_responses)):
    if classifier_responses[i].results[0]["is-malicious"]["scores"]["malicious"] >= .5:
        y_pred.append("malicious")
    else:
        y_pred.append("benign")


print(classifier_responses)

# Compute confusion matrix
cm = confusion_matrix(y_true, y_pred)

# Create DataFrame
df_cm = pd.DataFrame(cm, index=pd.unique(y_true), columns=pd.unique(y_true))

# Plot heatmap
plt.figure(figsize=(8, 6))
sns.heatmap(df_cm, annot=True, fmt="d", cmap="Blues")
plt.xlabel("Predicted Label")
plt.ylabel("True Label")
plt.title("Confusion Matrix")
plt.show()
