.. _linux-commmand-no-jikko:

##################################################
アドホックコマンドで Linux コマンドを実行
##################################################
:command:`adhoc` コマンドで Linux コマンドを管理対象ノード上で実行します。

.. _linux-commmand-no-jikko-inventory:

**************************************************
使用するインベントリの内容
**************************************************
- :file:`hosts.yml`

   .. literalinclude:: ./yaml/hosts.yml
      :language: yaml

- :file:`host_vars/hydrogen.yml`

   .. literalinclude:: ./yaml/host_vars/hydrogen.yml
      :language: yaml

- :file:`host_vars/helium.yml`

   .. literalinclude:: ./yaml/host_vars/helium.yml
      :language: yaml

- :file:`host_vars/lithium.yml`

   .. literalinclude:: ./yaml/host_vars/lithium.yml
      :language: yaml

.. _linux-commmand-no-jikko-kobun:

**************************************************
構文
**************************************************
:ref:`ansible コマンドの構文 <ansible-command-kobun>` から主に使用するパラメーターを抽出・再構成しました。パラメーターの意味は「 :ref:`ansible-command-omona-parameter` 」を確認ください。

.. code-block:: none

   usage: ansible pattern [-i INVENTORY] [-m MODULE_NAME] [-a MODULE_ARGS] [-b]

.. list-table::
   :widths: 1, 8
   :header-rows: 1

   * - パラメーター
     - 設定内容
   * - -m
     - | ・ コマンドを直接実行する場合は ``ansible.builtin.command`` を指定またはパラメーター自体を省略する
       | ・ コマンドにパイプやリダイレクトなど shell 機能を使用する場合は ``ansible.builtin.shell`` を指定する
   * - -a
     - | 実行する Linux コマンドを指定する
       | オプションなどを指定する場合は指定する実行する Linux コマンド全体を ``'`` または ``"`` でくくる

.. _linux-commmand-no-jikko-siyorei:

**************************************************
使用例
**************************************************

管理対象ノード hydrogen のホームディレクトリ名を確認する
----------------------------------------------------------------------------------------------------
.. code-block:: none

   piyo@vmpc:~/example/ex3$ ansible hydrogen -i hosts.yml -a pwd
   hydrogen | CHANGED | rc=0 >>
   /home/ansible-user
   piyo@vmpc:~/example/ex3$ 

すべての管理対象ノードのメモリの使用状況を確認する
----------------------------------------------------------------------------------------------------
.. code-block:: none

   piyo@vmpc:~/example/ex3$ ansible all -i hosts.yml -a free
   hydrogen | CHANGED | rc=0 >>
                 total        used        free      shared  buff/cache   available
   Mem:        2024048      208828     1626160       16948      189060     1651884
   Swap:       2158588           0     2158588
   lithium | CHANGED | rc=0 >>
                 total        used        free      shared  buff/cache   available
   Mem:        2024048      211944     1593000        8756      219104     1656440
   Swap:       2158588           0     2158588
   helium | CHANGED | rc=0 >>
                 total        used        free      shared  buff/cache   available
   Mem:        2024048      211620     1592872        8756      219556     1656756
   Swap:       2158588           0     2158588
   piyo@vmpc:~/example/ex3$ 

管理対象ノード helium のディスクの使用状況を確認する
----------------------------------------------------------------------------------------------------
.. code-block:: none

   piyo@vmpc:~/example/ex3$ ansible helium -i hosts.yml -a 'df -h --total'
   helium | CHANGED | rc=0 >>
   Filesystem                  Size  Used Avail Use% Mounted on
   devtmpfs                    969M     0  969M   0% /dev
   tmpfs                       989M     0  989M   0% /dev/shm
   tmpfs                       989M  8.6M  980M   1% /run
   tmpfs                       989M     0  989M   0% /sys/fs/cgroup
   /dev/mapper/cl_helium-root   29G  1.6G   27G   6% /
   /dev/sda2                  1014M  169M  846M  17% /boot
   /dev/sda1                   599M  6.9M  592M   2% /boot/efi
   tmpfs                       198M     0  198M   0% /run/user/1000
   total                        34G  1.8G   33G   6% -
   piyo@vmpc:~/example/ex3$ 

管理対象ノード lithium の :file:`/etc/passwd` ファイル内から ansible-user の情報を抽出する
----------------------------------------------------------------------------------------------------
.. code-block:: none

   piyo@vmpc:~/example/ex3$ ansible lithium -i hosts.yml -m ansible.builtin.shell -a 'cat /etc/passwd | grep ansible-user'
   lithium | CHANGED | rc=0 >>
   ansible-user:x:1000:1000::/home/ansible-user:/bin/bash
   piyo@vmpc:~/example/ex3$ 
