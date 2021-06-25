.. _vault-string:

##################################################
文字列を暗号化
##################################################
指定した文字列を暗号化します。今回は文字列 ansible-password を暗号化します。

.. literalinclude:: ./log/encrypt_string1.log
   :language: none

暗号化した結果をファイルに組み込みます。

■ 組込前

.. literalinclude:: ./yaml/host_vars/hydrogen.yml
   :language: yaml

■ 組み込み後

.. literalinclude:: ./yaml/host_vars/hydrogen-after.yml
   :language: yaml
