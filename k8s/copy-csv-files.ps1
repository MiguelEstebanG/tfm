Set-Location 'C:\Users\Usuario\Desktop\Miguel_Esteban_Gutierrez\MUIT\TFM\carpetas_varias\input'

# Copiar el archivo csv al nodo 1
kubectl exec -it nifi01-7c445c6776-2jgcr -- mkdir /opt/nifi/nifi-current/csv

kubectl cp .\Italian_Catalogue_earthquakes.csv nifi01-7c445c6776-2jgcr:/opt/nifi/nifi-current/csv

kubectl exec -it nifi01-7c445c6776-2jgcr -- chmod -R 777 /opt/nifi/nifi-current/csv

# Copiar el archivo csv al nodo 2
kubectl exec -it nifi02-854b7f5567-92lgr -- mkdir /opt/nifi/nifi-current/csv

kubectl cp .\Italian_Catalogue_earthquakes.csv nifi02-854b7f5567-92lgr:/opt/nifi/nifi-current/csv

kubectl exec -it nifi02-854b7f5567-92lgr -- chmod -R 777 /opt/nifi/nifi-current/csv

# Copiar el archivo csv al nodo 3
kubectl exec -it nifi03-5fd45fb864-nzb2f -- mkdir /opt/nifi/nifi-current/csv

kubectl cp .\Italian_Catalogue_earthquakes.csv nifi03-5fd45fb864-nzb2f:/opt/nifi/nifi-current/csv

kubectl exec -it nifi03-5fd45fb864-nzb2f -- chmod -R 777 /opt/nifi/nifi-current/csv
