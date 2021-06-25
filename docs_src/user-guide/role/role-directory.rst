.. _role-directory:

##################################################
roles ディレクトリ
##################################################
- roles で使用する各ファイルは :file:`roles` ディレクトリ内の決まったディレクトリに配置する
- :file:`tasks` ディレクトリだけが必須で、他のディレクトリは必要に応じて作成（使用）する

ロールのディレクトリ構造です。 :file:`hosts.yml` はインベントリファイル、 :file:`webservers.yml` はプレイブックファイルです。

.. literalinclude:: ./log/directory1.log
   :language: none
   :emphasize-lines: 3-23

ディレクトリごとの説明です。

- basic_webserver_configuration

   - ロール名
   - :file:`roles` ディレクトリ直下のディレクトリーの名前がロール名になる　→　"basic_webserver_configuration" がロール名になる

- tasks

   - 必須
   - ファイル名は :file:`main.yml`
   - ロールのタスクを定義する

- handlers

   - ファイル名は :file:`main.yml`
   - :file:`tasks/main.yml` ファイル内のタスクの ``notify`` ディレクティブに対応するハンドラーを定義する

- defaults

   - ファイル名は :file:`main.yml`
   - ロール内で使用する変数のデフォルト値（既定値）を定義する
   - 変数の中では優先度が低く、他の定義（ :file:`vars/main.yml` や ``host_vars/`` 、``group_vars`` 等）の中に同一の変数が存在する場合はそちらが優先される

- vars

   - ファイル名は :file:`main.yml`
   - ロール内で使用する変数を定義する

- files

   - ロール内で使用するファイルを配置する　→　``ansible.builtin.copy`` モジュールなどで使用するファイルを配置する
   - :file:`file1` や :file:`file2` のようにファイル名に任意の名前を使用できる

- templates

   - ロール内で使用するテンプレートファイル（変数を埋め込んだファイル）を配置する　→　``ansible.builtin.template`` モジュールなどで使用するファイルを配置する
   - :file:`templatefile1` や :file:`templatefile2` のようにテンプレートファイル名に任意の名前を使用できる

- library

   - ライブラリ（モジュール）を配置する
   - :file:`module1` や :file:`module2` のようにモジュール名に任意の名前を使用できる

- meta

   - ファイル名は :file:`main.yml`
   - メタ情報（ロール間の依存関係）を定義する
