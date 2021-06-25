.. _delegate-fuka:

##################################################
委任できないタスク
##################################################
次のモジュールを含むタスクは他のノードに実行を委任できません。

- ansible.builtin.include_role
- ansible.builtin.include_tasks
- ansible.builtin.include_vars
- ansible.builtin.include
- ansible.builtin.add_host

``ansible.builtin.include_tasks`` モジュールを使用したタスクに ``delegate_to`` ディレクティブを指定したプレイです。

.. literalinclude:: ./yaml/delegate1.yml
   :language: yaml
   :emphasize-lines: 8, 10

実行ログです。 ``delegate_to`` は有効ではないという意味のエラーが表示されました。

.. literalinclude:: ./log/delegate-fuka-1.log
   :language: none
   :emphasize-lines: 2

``ansible.builtin.import_tasks`` モジュールを使用したタスクに ``delegate_to`` ディレクティブを指定したプレイです。

.. literalinclude:: ./yaml/delegate4.yml
   :language: yaml
   :emphasize-lines: 8, 10

実行ログです。委任が可能なタスクなので、正常に実行しました。

.. literalinclude:: ./log/delegate-fuka-2.log
   :language: none
   :emphasize-lines: 2
