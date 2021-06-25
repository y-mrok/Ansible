.. _block-kihon:

##################################################
基本的な使い方
##################################################
インベントリの内容です。

.. literalinclude:: ./yaml/hosts.yml
   :language: yaml

CentOS8 と Ubuntu 20.04 LTS の管理対象ノード上に Web サーバーを構築します。処理手順は以下のとおりです。

1. パッケージのインストール
#. conf ファイルにサーバー名を設定
#. conf ファイルの構文チェック
#. サービスの起動（再起動）
#. ファイアウォールに http ポートを開ける

``block`` ディレクティブを使用していないプレイと実行ログです。前半が CentOS 用、後半が Ubuntu 用です。 

.. literalinclude:: ./yaml/block.yml
   :language: yaml

.. literalinclude:: ./log/block.log
   :language: none

``block`` ディレクティブを使用して、 CentOS 用と Ubuntu 用にグルーピングしたプレイと実行ログです。

.. literalinclude:: ./yaml/block2.yml
   :language: yaml
   :emphasize-lines: 8-9, 34-35, 39-40, 64-65

.. literalinclude:: ./log/block2.log
   :language: none

タスクをグルーピングする前は各タスクに ``become`` ディレクティブと ``when`` ディレクティブを設定していました。 ``block`` ディレクティブでグルーピングしたタスクに ``become`` ディレクティブと ``when`` ディレクティブを設定することで、各タスクに設定したのと同じことになります。実行していることは ``block`` ディレクティブを使用する前と同じなので実行ログの内容は同じです。

``block`` ディレクティブを使用して関連するタスクをまとめることで各タスクに ``when`` ディレクティブなど共通のディレクティブを設定せずに済むためタスク自体がスッキリします。
