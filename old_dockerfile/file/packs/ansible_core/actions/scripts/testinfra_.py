# coding: utf-8
import pytest
from st2common.runners.base_action import Action


class TestinfraAction(Action):

    def run(self, hosts, inventory, testcases, force_ansible, marks, **kwargs):
        self.logger.debug('hosts: %s' % hosts)
        self.logger.debug('inventory: %s' % inventory)
        self.logger.debug('testcases: %s' % testcases)
        self.logger.debug('force_ansible: %s' % force_ansible)
        self.logger.debug('marks: %s' % marks)
        self.logger.debug('kwargs: %s' % kwargs)

        exit_code = pytest.main(self._contact_args(hosts, inventory, testcases, force_ansible, marks, **kwargs))

        self.logger.debug('exit code: %s' % exit_code)

        return exit_code == 0, ''

    def _contact_args(self, hosts, inventory, testcases, force_ansible, marks, **kwargs):
        cmd_args = [
            '--hosts', 'ansible://{0}'.format(hosts),
            '--ansible-inventory', inventory,
        ]

        if force_ansible:
            cmd_args.append('--force-ansible')
        else:
            cmd_args.append('--ssh-identity-file')
            cmd_args.append('/root/.ssh/id_rsa')

        if marks:
            cmd_args.extend(['-m', marks])

        for k, v in kwargs:
            cmd_args.extend(['--' + k, v])

        cmd_args.append(testcases)
        self.logger.debug('cmd_args: %s' % cmd_args)

        return cmd_args
