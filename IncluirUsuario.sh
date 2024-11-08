#!/bin/bash

# Excluindo diret�rios, grupos e usu�rios existentes
echo
echo "Removendo diret�rios, grupos e usu�rios previamente criados..."
echo

# Removendo os diret�rios, se existirem
rm -rf /publico /adm /ven /sec

# Removendo os grupos, se existirem
groupdel GRP_ADM 
groupdel GRP_VEN 
groupdel GRP_SEC 

# Removendo usuarios, se existirem
userdel -r carlos 
userdel -r maria 
userdel -r joao 
userdel -r debora 
userdel -r sebastiana 
userdel -r roberto 
userdel -r josefina 
userdel -r amanda 
userdel -r rogerio 

echo "Etapa de exclus�o conclu�da."
echo

# Criando novos grupos
echo "Criando novos grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Criando diret�rios
echo "Criando diret�rios..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo
# Definindo permiss�es para os diret�rios
echo "Definindo permiss�es para os diret�rios..."
# Diret�rio p�blico - todos t�m acesso total
chmod 777 /publico
chown root:root /publico

echo
# Diret�rio adm - acesso total para GRP_ADM
chmod 770 /adm
chown root:GRP_ADM /adm

# Diret�rio ven - acesso total para GRP_VEN
chmod 770 /ven
chown root:GRP_VEN /ven

# Diret�rio sec - acesso total para GRP_SEC
chmod 770 /sec
chown root:GRP_SEC /sec

# Criando usu�rios e adicionando aos grupos
echo "Criando usu�rios e associando aos grupos..."

# Usu�rios do grupo GRP_ADM
for user in carlos maria joao; do
    useradd -m -s /bin/bash -G GRP_ADM $user
    echo "Usu�rio $user criado e adicionado ao grupo GRP_ADM."
done

# Usu�rios do grupo GRP_VEN
for user in debora sebastiana roberto; do
    useradd -m -s /bin/bash -G GRP_VEN $user
    echo "Usu�rio $user criado e adicionado ao grupo GRP_VEN."
done

echo
# Usu�rios do grupo GRP_SEC
for user in josefina amanda rogerio; do
    useradd -m -s /bin/bash -G GRP_SEC $user
    echo "Usu�rio $user criado e adicionado ao grupo GRP_SEC."
done

echo "Script conclu�do."
