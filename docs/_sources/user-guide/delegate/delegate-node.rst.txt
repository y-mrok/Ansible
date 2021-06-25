.. _delegate-node:

##################################################
委任先に指定するノードの条件
##################################################
委任先に指定するノードは必要があります。要件を満たしていればインベントリに記述されていなくても問題ありません。

.. _delegate-node-inventory:

**************************************************
インベントリに記述した管理対象ノードに委任
**************************************************
インベントリに記述した管理対象ノードに委任する場合、インベントリに記述したホスト名で委任先を指定します。委任先に指定した管理対象ノードの次の項目に設定した値などを使用して接続します。

- ansible_host
- ansible_user
- ansible_ssh_private_key_file
- ansible_password
- ansible_port

.. _delegate-node-non-inventory:

**************************************************
インベントリに記述していないノードに委任
**************************************************

.. _delegate-node-non-inventory-host-vars:

host_vars/ ディレクトリ内に定義されているノード
==================================================
:file:`host_vars/` ディレクトリ内だけに定義されているノードに委任する場合、インベントリのホスト名で委任先を指定します。委任先に指定したノードの次の項目に設定した値などを使用して接続します。

- ansible_host
- ansible_user
- ansible_ssh_private_key_file
- ansible_password
- ansible_port

例えばノード hydrogen に実行を委任するとき :file:`host_vars/hydrogen.yml` に記載した内容で接続します。

.. _delegate-node-non-inventory-non-host-vars:

host_vars/ ディレクトリ内に定義されていないノード
==================================================
インベントリにも :file:`host_vars/` ディレクトリ内にも定義されていないノードに実行を委任する場合、 IP アドレスまたは名前解決ができる場合はホスト名で委任先を指定します。これらのノードはコントロールノードから ssh 接続できる必要があります。

.. code-block:: none
   :emphasize-lines: 1

   piyo@vmpc:~$ ssh 192.168.23.14
   Warning: Permanently added '192.168.23.14' (ECDSA) to the list of known hosts.
   Last login: Sat Jun  5 00:39:09 2021 from 192.168.23.224
   [piyo@beryllium ~]$

.. code-block:: none
   :emphasize-lines: 1

   piyo@vmpc:~$ ssh beryllium
   Warning: Permanently added 'beryllium,192.168.23.14' (ECDSA) to the list of known hosts.
   Last login: Sat Jun  5 11:17:05 2021 from 192.168.23.224
   [piyo@beryllium ~]$ 

上記ログからわかるように、インベントリにも :file:`host_vars/` ディレクトリ内にも定義されていないノードに委任する場合、次の条件をすべて満たす必要があります。

- 「 :ref:`managed-node-no-yoken` 」を満たしていること
- コントロールノードから公開鍵認証で ssh 接続できること
- 接続時のアカウント名はコントロールノードにログインしているアカウント名と同じであること
