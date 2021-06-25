.. _inventory-no-kihon:

##################################################
インベントリの基本
##################################################
- :ref:`YAML <yaml>` を使用して記述する
- :ref:`マッピング <yaml-mapping>` および :ref:`マッピングのネスト <yaml-nest-mapping>` で定義する
- すべての管理対象ノードは "all" グループに含まれる

インベントリの基本的なフォーマットです。

.. code-block:: yaml
   :linenos:

   ---
   all:
     hosts:
       管理対象ノード名
         接続情報

各行の説明です。

.. list-table::
   :header-rows: 1
   :widths: 1, 5, 20

   * - 行
     - 内容
     - 説明
   * - 1
     - ---
     - YAML による記述の開始の宣言
   * - 2
     - all:
     - すべての管理対象ノードを含むグループ "all" の宣言
   * - 3
     - hosts:
     - ホスト（管理対象ノード）の記述をする宣言
   * - 4
     - 管理対象ノード名
     - インベントリ内で管理対象ノードを識別するための名前
   * - 5
     - 接続情報
     - 管理対象ノードに接続するための情報（ IP アドレスやログインアカウント等）

管理対象ノードが複数の場合、次の部分を管理対象ノードの数だけ記述します。

.. code-block:: yaml

   管理対象ノード名
     接続情報

次の 3 つの管理対象ノードを例にインベントリを書きます。

.. list-table::
   :header-rows: 1

   * - ホスト名
     - IP アドレス
     - ログインユーザー名
     - パスワード
     - 鍵ファイルのパス
   * - hydrogen
     - 192.168.23.11
     - ansible-user
     - fo&Ebr=3hucrlpeclspE
     - ~/.ssh/id_ed25519
   * - helium
     - 192.168.23.12
     - ansible-user
     - fo&Ebr=3hucrlpeclspE
     - ~/.ssh/id_ed25519
   * - lithium
     - 192.168.23.13
     - ansible-user
     - fo&Ebr=3hucrlpeclspE
     - ~/.ssh/id_ed25519

パスワード認証のインベントリです。

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

鍵認証のインベントリです。

.. literalinclude:: ./yaml/hosts2.yml
   :language: yaml

認証情報の定義に使用した変数と設定する値です。このように管理対象ノードに関係する変数を「ホスト変数」と呼びます。

.. list-table::
   :header-rows: 1
   :widths: 1, 20

   * - 変数
     - 設定する値
   * - ansible_host:
     - 管理対象ホストの IP アドレス、名前解決ができるときはホスト名の指定も可能
   * - ansible_user:
     - 管理対象ノードにログインするときのユーザー名
   * - ansible_password:
     - 管理対象ノードにパスワード認証でログインするときのパスワード
   * - ansible_ssh_private_key_file:
     - 管理対象ノードに鍵認証でログインするときの秘密鍵のパス
   * - ansible_python_interpreter:
     - 管理対象ノードで使用する Python のパス
   * - ansible_port:
     - 管理対象ノードに接続するときのポート番号（ ssh 接続のデフォルトは 22 ）

.. note::

   管理対象ノードに関係するホスト変数の詳細は `Ansible Documentation <https://docs.ansible.com/ansible/latest/index.html>`_ の `Connecting to hosts: behavioral inventory parameters <https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#connecting-to-hosts-behavioral-inventory-parameters>`_ を確認ください。
