.. _fukusu-no-inventory:

##################################################
複数のインベントリ
##################################################
ここまでは 1 つのインベントリファイル（ :file:`hosts.yml` ）を扱ってきました。

各ファイルの配置

.. literalinclude:: ./log/tree.log
   :language: none

- :file:`hosts.yml`

   .. literalinclude:: ./yaml/hosts10.yml
      :language: yaml

- :file:`host_vars/` ディレクトリ内

   - :file:`host_vars/hydrogen.yml`

      .. literalinclude:: ./yaml/host_vars/hydrogen.yml
         :language: yaml

   - :file:`host_vars/helium.yml`

      .. literalinclude:: ./yaml/host_vars/helium.yml
         :language: yaml

   - :file:`host_vars/lithium.yml`

      .. literalinclude:: ./yaml/host_vars/lithium.yml
         :language: yaml

- :file:`group_vars` ディレクトリ内

   - :file:`group_vars/all.yml`

      .. literalinclude:: ./yaml/group_vars/all.yml
         :language: yaml

   - :file:`group_vars/webservers.yml`

      .. literalinclude:: ./yaml/group_vars/webservers.yml
         :language: yaml

   - :file:`group_vars/dbservers.yml`

      .. literalinclude:: ./yaml/group_vars/dbservers.yml
         :language: yaml

- :command:`ansible-inventory -i hosts.yml --list --yaml` の結果

   .. code-block:: none
   
      piyo@vmpc:~/example/ex2$ ansible-inventory -i hosts.yml --list --yaml
      all:
        children:
          dbservers:
            hosts:
              lithium:
                ansible_host: 192.168.23.13
                ansible_ssh_private_key_file: ~/.ssh/id_ed25519
                ansible_user: ansible-user
                db_pass: tiger
                db_port: 1521
                db_user: scott
                http_port: 8080
                locate_timezone: Asia/Tokyo
          ungrouped:
            hosts:
              hydrogen:
                ansible_host: 192.168.23.11
                ansible_ssh_private_key_file: ~/.ssh/id_ed25519
                ansible_user: ansible-user
                locate_timezone: Asia/Tokyo
          webservers:
            hosts:
              helium:
                ansible_host: 192.168.23.12
                ansible_ssh_private_key_file: ~/.ssh/id_ed25519
                ansible_user: ansible-user
                http_port: 8080
                locate_timezone: Asia/Tokyo
              lithium: {}
      piyo@vmpc:~/example/ex2$ 

インベントリファイルは 1 つに限定されません。必要に応じて以下の方法で複数のインベントリファイルを指定します。

.. include:: ./fukusu-no-invnetory-file-wo-sitei.txt
.. include:: ./inventory-file-no-directory-wo-shitei.txt
