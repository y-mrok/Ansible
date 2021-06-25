.. _play-hensu-vars:

##################################################
vars ディレクティブ
##################################################
- :ref:`マッピング <yaml-mapping>` で定義する

.. _play-hensu-vars-rei:

**************************************************
使用例
**************************************************
- マッピングで定義

.. code-block:: yaml

   vars:
     Hokkaido: Sapporo
     Aomori: Aomori
     Ibaraki: Mito

- マッピングをネストした定義

.. code-block:: yaml

   vars:
     Hokkaido:
       kubun: Hokkaido
       todofukencho: Sapporo

- マッピングの中にシーケンスをネストした定義

.. code-block:: yaml

   vars:
     user_account:
       - hanako-san
       - taro-san
       - jiro-san


- マッピングの中にシーケンスをネストし、シーケンスの中にマッピングをネストした定義

.. code-block:: yaml

   vars:
     user_account:
       - user_name: hanako-san
         user_password: hanako-no-password
       - user_name: taro-san
         user_password: taro-no-password
       - user_name: jiro-san
         user_password: jiro-no-password
