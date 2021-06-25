.. _jyoken-loop:

##################################################
loop ディレクティブを併用した場合
##################################################
``when`` ディレクティブと ``loop`` ディレクティブを併用した場合、 loop 変数 item に値をセットした後に ``when`` ディレクティブの条件式が評価されます。

.. literalinclude:: ./yaml/when15.yml
   :language: none

.. literalinclude:: ./log/when15.log
   :language: none
