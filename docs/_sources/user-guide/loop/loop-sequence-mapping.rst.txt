.. _loop-sequence-mapping:

########################################################
シーケンスの中にマッピングをネストとの組み合わせ
########################################################
``loop`` ディレクティブとシーケンスの中にマッピングをネストとの組み合わせを確認します。まず、次のプレイでループ変数 item にどのように値がセットされるか確認します。

.. literalinclude:: ./yaml/user1.yml
   :language: yaml
   :emphasize-lines: 9, 11-16

実行ログです。 :ref:`マッピングの中にマッピングをネスト <hensu-no-sansho-mapping-nest>` した構造になっています。

.. literalinclude:: ./log/user1.log
   :language: none
   :emphasize-lines: 8-10, 15-17, 22-24 

それぞれの変数を参照する場合、次のようになります。

.. literalinclude:: ./yaml/user2.yml
   :language: yaml
   :emphasize-lines: 9-10, 13-18

実行ログです。

.. literalinclude:: ./log/user2.log
   :language: none
   :emphasize-lines: 6-8
