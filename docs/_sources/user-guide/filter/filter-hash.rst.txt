.. _filter-hash:

##################################################
ハッシュ関連のフィルター
##################################################
- 変数に設定した値のハッシュ値を返す

.. _filter-hash-koubun:

**************************************************
構文
**************************************************
- SHA-1

   .. code-block:: yaml

      変数 | hash('sha1')

- MD5

   .. code-block:: yaml

      変数 | hash('md5')

- SHA-256 （ salt の指定なし = ランダム salt ）

   .. code-block:: yaml

      変数 | password_hash('sha256')

- SHA-256 （ salt の指定あり）

   .. code-block:: yaml

      変数 | password_hash('sha256' , 'saltの文字列' )

- SHA-512 （ salt の指定なし = ランダム salt ）

   .. code-block:: yaml

      変数 | password_hash('sha512')

- SHA-512 （ salt の指定あり）

   .. code-block:: yaml

      変数 | password_hash('sha512' , 'saltの文字列' )

.. _filter-hash-rei:

**************************************************
使用例
**************************************************
管理対象ノードにパスワード認証用のユーザーアカウントを作成する。

.. literalinclude:: ./yaml/filter11.yml
   :language: yaml
   :emphasize-lines: 10

実行ログです。

.. literalinclude:: ./log/filter11.log
   :language: none

管理対象ノードの :file:`/etc/shadow` ファイルの内容です。作成したアカウントのパスワードが SHA-512 でハッシュ化された値で登録されました。アカウントごとに salt が異なっています。

.. literalinclude:: ./log/filter11-1.log
   :language: none
