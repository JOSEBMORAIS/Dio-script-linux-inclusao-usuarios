#!/bin/bash

# Excluindo diretórios, grupos e usuários existentes
echo
echo "Removendo diretórios, grupos e usuários previamente criados..."
echo

# Removendo os diretórios, se existirem
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

echo "Etapa de exclusão concluída."
echo

# Criando novos grupos
echo "Criando novos grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Criando diretórios
echo "Criando diretórios..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo
# Definindo permissões para os diretórios
echo "Definindo permissões para os diretórios..."
# Diretório público - todos têm acesso total
chmod 777 /publico
chown root:root /publico

echo
# Diretório adm - acesso total para GRP_ADM
chmod 770 /adm
chown root:GRP_ADM /adm

# Diretório ven - acesso total para GRP_VEN
chmod 770 /ven
chown root:GRP_VEN /ven

# Diretório sec - acesso total para GRP_SEC
chmod 770 /sec
chown root:GRP_SEC /sec

# Criando usuários e adicionando aos grupos
echo "Criando usuários e associando aos grupos..."

# Usuários do grupo GRP_ADM
for user in carlos maria joao; do
    useradd -m -s /bin/bash -G GRP_ADM $user
    echo "Usuário $user criado e adicionado ao grupo GRP_ADM."
done

# Usuários do grupo GRP_VEN
for user in debora sebastiana roberto; do
    useradd -m -s /bin/bash -G GRP_VEN $user
    echo "Usuário $user criado e adicionado ao grupo GRP_VEN."
done

echo
# Usuários do grupo GRP_SEC
for user in josefina amanda rogerio; do
    useradd -m -s /bin/bash -G GRP_SEC $user
    echo "Usuário $user criado e adicionado ao grupo GRP_SEC."
done

echo "Script concluído."
