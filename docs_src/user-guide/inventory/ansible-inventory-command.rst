.. _ansible-inventory-command:

##################################################
ansible-inventory コマンド
##################################################
複数のファイルに分割したインベントリを 1 つにまとめるコマンドです。このコマンドを使用すると、「 :ref:`ホスト変数やグループ変数を分離（部品化）する場合 <inventory-wo-seirisuru-merit-demeirt-parts>` 」で挙げたデメリットを解消できます。

.. _ansible-inventory-command-kobun:

**************************************************
構文
**************************************************
:command:`ansible-inventory -h` の表示内容です。

.. code-block:: none

   usage: ansible-inventory [-h] [--version] [-v] [-i INVENTORY] [--vault-id VAULT_IDS]
                            [--ask-vault-password | --vault-password-file VAULT_PASSWORD_FILES] [--playbook-dir BASEDIR] [--list] [--host HOST]
                            [--graph] [-y] [--toml] [--vars] [--export] [--output OUTPUT_FILE]
                            [host|group]
   
   positional arguments:
     host|group
   
   optional arguments:
     --ask-vault-password, --ask-vault-pass
                           ask for vault password
     --export              When doing an --list, represent in a way that is optimized for export,not as an accurate representation of how Ansible has
                           processed it
     --output OUTPUT_FILE  When doing --list, send the inventory to a file instead of to the screen
     --playbook-dir BASEDIR
                           Since this tool does not use playbooks, use this as a substitute playbook directory.This sets the relative path for many
                           features including roles/ group_vars/ etc.
     --toml                Use TOML format instead of default JSON, ignored for --graph
     --vars                Add vars to graph display, ignored unless used with --graph
     --vault-id VAULT_IDS  the vault identity to use
     --vault-password-file VAULT_PASSWORD_FILES, --vault-pass-file VAULT_PASSWORD_FILES
                           vault password file
     --version             show program's version number, config file location, configured module search path, module location, executable location and
                           exit
     -h, --help            show this help message and exit
     -i INVENTORY, --inventory INVENTORY, --inventory-file INVENTORY
                           specify inventory host path or comma separated host list. --inventory-file is deprecated
     -v, --verbose         verbose mode (-vvv for more, -vvvv to enable connection debugging)
     -y, --yaml            Use YAML format instead of default JSON, ignored for --graph
   
   Actions:
     One of following must be used on invocation, ONLY ONE!
   
     --graph               create inventory graph, if supplying pattern it must be a valid group name
     --host HOST           Output specific host info, works as inventory script
     --list                Output all hosts info, works as inventory script
   
   Show Ansible inventory information, by default it uses the inventory script JSON format

.. _ansible-inventory-command-siyorei:

**************************************************
主なパラメーターと使用例
**************************************************
.. list-table:: ansible-inventory コマンドの主なパラメーター
   :widths: 1, 6
   :header-rows: 1

   * - パラメーター
     - 意味
   * - -i
     - 対象になるインベントリファイルを指定する
   * - --graph
     - グループと管理対象ノードの関係をツリー構造で表示する
   * - --host
     - 指定した管理対象ノードに割り当てられた変数を表示する
   * - --list
     - 管理対象ノードに割り当てられた変数やグループを確認する
   * - --yaml
     - "--host" や "--list" と併用し、結果を YAML 形式に表示する

.. _ansible-inventory-command-siyorei-graph:

グループと管理対象ノードの関係を図示する：--graph
==================================================
``--graph`` パラメーターはグループと管理対象ノードの関係を図示します。先頭に "@" が付いているのがグループです。

.. code-block:: none

   piyo@vmpc:~/example/ex2$ ansible-inventory -i hosts.yml --graph
   @all:
     |--@dbservers:
     |  |--lithium
     |--@ungrouped:
     |  |--hydrogen
     |--@webservers:
     |  |--helium
     |  |--lithium
   piyo@vmpc:~/example/ex2$ 

.. _ansible-inventory-command-siyorei-host:

指定した管理対象ノードに割り当てられた変数を確認する：--host
============================================================
``--host`` パラメーターは指定の管理対象ノードに割り当てられた変数を確認します。

.. code-block:: none

   piyo@vmpc:~/example/ex2$ ansible-inventory -i hosts.yml --host hydrogen
   {
       "ansible_host": "192.168.23.11",
       "ansible_ssh_private_key_file": "~/.ssh/id_ed25519",
       "ansible_user": "ansible-user",
       "locate_timezone": "Asia/Tokyo"
   }
   piyo@vmpc:~/example/ex2$ 

``--yaml`` パラメーターと併用し、結果を YAML 形式で表示します。

.. code-block:: none

   piyo@vmpc:~/example/ex2$ ansible-inventory -i hosts.yml --host hydrogen --yaml
   ansible_host: 192.168.23.11
   ansible_ssh_private_key_file: ~/.ssh/id_ed25519
   ansible_user: ansible-user
   locate_timezone: Asia/Tokyo
   piyo@vmpc:~/example/ex2$ 

.. _ansible-inventory-command-siyorei-list:

管理対象ノードに割り当てられた変数やグループを確認する：--list
==============================================================
``--list`` パラメーターは管理対象ノードごとに割り当てられた変数やグループを確認します。

.. code-block:: none

   piyo@vmpc:~/example/ex2$ ansible-inventory -i hosts.yml --list
   {
       "_meta": {
           "hostvars": {
               "helium": {
                   "ansible_host": "192.168.23.12",
                   "ansible_ssh_private_key_file": "~/.ssh/id_ed25519",
                   "ansible_user": "ansible-user",
                   "http_port": 8080,
                   "locate_timezone": "Asia/Tokyo"
               },
               "hydrogen": {
                   "ansible_host": "192.168.23.11",
                   "ansible_ssh_private_key_file": "~/.ssh/id_ed25519",
                   "ansible_user": "ansible-user",
                   "locate_timezone": "Asia/Tokyo"
               },
               "lithium": {
                   "ansible_host": "192.168.23.13",
                   "ansible_ssh_private_key_file": "~/.ssh/id_ed25519",
                   "ansible_user": "ansible-user",
                   "db_pass": "tiger",
                   "db_port": 1521,
                   "db_user": "scott",
                   "http_port": 8080,
                   "locate_timezone": "Asia/Tokyo"
               }
           }
       },
       "all": {
           "children": [
               "dbservers",
               "ungrouped",
               "webservers"
           ]
       },
       "dbservers": {
           "hosts": [
               "lithium"
           ]
       },
       "ungrouped": {
           "hosts": [
               "hydrogen"
           ]
       },
       "webservers": {
           "hosts": [
               "helium",
               "lithium"
           ]
       }
   }
   piyo@vmpc:~/example/ex2$ 

``--yaml`` パラメーターと併用し、結果を YAML 形式で表示します。

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
