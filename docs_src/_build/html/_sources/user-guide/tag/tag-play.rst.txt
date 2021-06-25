.. _tag-play:

##################################################
プレイ
##################################################
プレイにタグを設定する場合 :ref:`targets-section` に設定します。

プレイブック内に 2 つのプレイを定義し、プレイごとにタグを設定した例です。

.. literalinclude:: ./yaml/tag9.yml
   :emphasize-lines: 5, 18
   :language: yaml

タグ play1 を指定して実行したログです。タグ play1 を設定したプレイのタスクだけを実行しました。

.. literalinclude:: ./log/tag-play-1.log
   :language: none

タグ play2 を指定して実行したログです。タグ play2 を設定したプレイのタスクだけを実行しました。

.. literalinclude:: ./log/tag-play-2.log
   :language: none

タグ all を指定した実行ログです。これはタグを指定せずに実行した場合と同じ結果です。

.. literalinclude:: ./log/tag-play-3.log
   :language: none

.. literalinclude:: ./log/tag-play-4.log
   :language: none
