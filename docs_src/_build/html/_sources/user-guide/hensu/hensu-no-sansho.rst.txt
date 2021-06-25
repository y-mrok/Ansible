.. _hensu-no-sansho:

##################################################
変数の参照方法
##################################################

.. _hensu-no-sansho-mapping:

**************************************************
マッピングの参照
**************************************************
- プレイ内で変数を参照するときは ``{{`` と ``}}`` でくくる
- パラメーターの設定値に変数を使用するときなど ``:`` の後で変数を参照するときは ``"{{`` と ``}}"`` または ``'{{`` と ``}}'`` でくくる

.. literalinclude:: ./yaml/sample9.yml
   :emphasize-lines: 7-8, 13-14, 17
   :language: yaml

.. _hensu-no-sansho-mapping-nest:

**************************************************
マッピングをネストした場合の参照
**************************************************
- 「 :ref:`hensu-no-sansho-mapping` 」のルール　＋　下位の変数を ``['`` と ``']`` でくくって参照する

.. literalinclude:: ./yaml/sample10.yml
   :emphasize-lines: 7-9, 14-15, 18
   :language: yaml

.. _hensu-no-sansho-mapping-sequence-nest:

**************************************************
マッピングの中にシーケンスをネストした場合の参照
**************************************************
- 「 :ref:`hensu-no-sansho-mapping` 」のルール　＋　 要素番号（ゼロオリジン）を ``[`` と ``]`` でくくって参照する

.. literalinclude:: ./yaml/sample11.yml
   :emphasize-lines: 7-9, 14-15, 18
   :language: yaml

.. _hensu-no-sansho-mapping-sequence-mapping-nest:

**************************************************************************************
マッピングの中にシーケンスをネストし、シーケンスの中にマッピングをネストした場合の参照
**************************************************************************************
.. literalinclude:: ./yaml/sample12.yml
   :emphasize-lines: 7-11, 16-17, 22-23, 28, 31
   :language: yaml

.. _hensu-no-sansho-fact:

**************************************************
ファクト変数の参照
**************************************************
- 基本は上述の 4 パターンと同じ
- 最上位の変数名は ansible_facts
- 下位の変数を参照するとき、プレフィックスの ``ansible_`` は削除する

ファクト変数の最初の部分です。

.. code-block:: none

   hydrogen | SUCCESS => {
       "ansible_facts": {
           "ansible_all_ipv4_addresses": [
               "192.168.23.11"
           ],
           "ansible_all_ipv6_addresses": [
               "fe80::8ac4:75a6:8719:7a"
           ],
           "ansible_apparmor": {
               "status": "disabled"
           },
           "ansible_architecture": "x86_64",

このように先頭は ``ansible_facts`` です。したがって、ファクト変数は次のように表記します。

.. code-block:: none

   ansible_facts['下位の変数名`]

- ansible_all_ipv4_addresses

   .. code-block:: none
   
      "ansible_facts['all_ipv4_addresses'][0]"

- ansible_apparmor 内の status

   .. code-block:: none
   
      ansible_facts['apparmor']['status']

- ansible_architecture

   .. code-block:: none
   
      ansible_facts['architecture']
