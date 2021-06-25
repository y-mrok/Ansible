.. _/4-tu-no-section:

##################################################
4 つのセクション
##################################################

.. _targets-section:

**************************************************
targets セクション
**************************************************
- 必須のセクション
- プレイの実行対象になる管理対象ノードを指定する

.. _targets-section-siyohindo-ga-takai-directive:

使用頻度が高いディレクティブ
==================================================
.. list-table::
   :header-rows: 1
   :widths: 1, 5

   * - ディレクティブ
     - 説明
   * - | hosts
       | ※必須※
     - プレイの実行対象になる管理対象ノードまたはグループを指定する
   * - become
     - | プレイ内のすべてのタスクを管理者権限で実行するか否かを指定する
       | ・yes：管理者権限で実行する
       | ・no ：管理者権限で実行しない（デフォルト）
   * - gather_facts 
     - | 管理対象ノードのファクト変数を収集するか否かを指定する
       | ・yes：収集する（デフォルト）
       | ・no ：収集しない

記述例：

- プレイを管理者権限で実行する
- ファクト変数を収集しない

.. code-block:: yaml

   ---
   - name: Sample usage of hosts
     hosts: all
     become: yes
     gather_facts: no

.. _targets-section-hosts-directive-no-sitei-pattern:

hosts ディレクティブの管理対象ノードの指定パターン
==================================================
- すべての管理対象ノードを指定　→　all
- 特定の管理対象ノードだけ指定　→　管理対象ノード名
- グループを指定　→　グループに含まれるすべての管理対象ノードを指定したことと同じ
- 管理対象ノードやグループを複数指定　→　``,`` で連結
- 複数のグループに共通して含まれる管理対象ノードを指定　→　グループを ``:&`` で連結
- 複数のグループのすべての管理対象ノードを指定　→　グループを ``:`` で連結

使用するインベントリ

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

- すべての管理対象ノード

.. code-block:: yaml

   hosts: all

- 管理対象ノードを 1 つだけ指定

.. code-block:: yaml

   hosts: hydrogen

- 複数の管理対象ノードを指定

.. code-block:: yaml

   hosts: hydrogen, lithium

- グループを指定

.. code-block:: yaml

   hosts: webservers

- 複数のグループを指定

.. code-block:: yaml

   hosts: dbservers, dnsservers

- 管理対象ノードとグループを指定

.. code-block:: yaml

   hosts: hydrogen, dbservers

- 両方のグループに含まれる管理対象ノードだけを指定

.. code-block:: yaml

   hosts: webservers:&dbservers

- 両方のグループに含まれるすべての管理対象ノードを指定

.. code-block:: yaml

   hosts: dbservers:dnsservers

.. _vars-section:

**************************************************
vars セクション
**************************************************
- プレイ内で使用する変数を指定（定義）する
- 詳細は「 :ref:`hensu` 」を参照

.. _tasks-section:

**************************************************
tasks セクション
**************************************************
- 必須のセクション
- 管理対象ノードで実行するタスクを :ref:`シーケンス <yaml-sequence>` で記述する
- タスクは記述した順に実行する

.. _tasks-section-task:

タスク
==================================================
- Ansible の実行単位で最小のもの
- モジュールにパラメーターで値を与えて、何らかの実行をできるようにしたもの

.. note::

   Ansible が用意しているすべてのモジュールは次のリンクで確認ください。

   `Collection Index <https://docs.ansible.com/ansible/latest/collections/index.html>`_

.. _tasks-section-siyohindo-ga-takai-directive:

使用頻度が高いディレクティブ
==================================================
.. list-table::
   :header-rows: 1
   :widths: 1, 5

   * - ディレクティブ
     - 説明
   * - name
     - タスクに名前を付ける（ほぼ必須）
   * - become
     - | タスクを管理者権限で実行するか否かを指定する
       | ・yes：管理者権限で実行する
       | ・no ：管理者権限で実行しない（デフォルト）
   * - when
     - | 条件を設定し、その成否でタスクを実行するか否かを判別する
       | ・条件が成立：タスクを実行する
       | ・条件が不成立：タスクの実行をスキップする
   * - loop
     - タスクを繰り返し実行する

.. _tasks-section-task-no-rei:

タスクの例
==================================================
下記は :ref:`アドホックコマンドで実行したもの <ansible-module-no-jikko>` をタスクに書き直した結果です。

.. literalinclude:: ./yaml/tasks.yml
   :language: yaml

``name`` ディレクティブから始まる 3 つのタスクが含まれています。

.. code-block:: yaml

   - name: Install Apache
     ansible.builtin.dnf:
       name: httpd
       state: present
     become: yes

.. code-block:: yaml

   - name: Enabling Apache services and starting services at startup
     ansible.builtin.systemd:
       name: httpd.service
       state: started
       enabled: yes
     become: yes

.. code-block:: yaml

   - name: Open up the http service in the firewall
     ansible.posix.firewalld:
       service: http
       permanent: yes
       state: enabled
       immediate: yes
     become: yes


.. _handlers-section:

**************************************************
handlers セクション
**************************************************
- tasks セクション内のタスクを実行した結果、**管理対象ノードの状態が変更になった場合に tasks セクションの実行後に一度だけ実行するタスク** を定義する
- 詳細は「 :ref:`handlers <handlers>` 」を参照
