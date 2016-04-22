#/usr/bin/env python -tt
import os
import sys
import subprocess

import re

SSH_AGENT_CMD = 'ssh-agent'
SSH_SOCK_TEMPLATE = r'SSH_AUTH_SOCK=([/].*agent[.]\d+); export SSH_AUTH_SOCK;'
SSH_PID_TEMPLATE  = r'SSH_AGENT_PID=(\d+); export SSH_AGENT_PID;'

ssh_agent_proc = subprocess.run(SSH_AGENT_CMD,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
ssh_agent_error  = ssh_agent_proc.stderr.decode('utf-8')
ssh_agent_output = ssh_agent_proc.stdout.decode('utf-8')

ssh_sock_re = re.search(SSH_SOCK_TEMPLATE, ssh_agent_output)
ssh_pid_re  = re.search(SSH_PID_TEMPLATE, ssh_agent_output)

if ssh_agent_error or not (ssh_sock_re and ssh_pid_re):
    sys.stderr.write('Error executing ssh-agent:\n')
    sys.stderr.write('\tstandard out: "{0}"\n'.format(ssh_agent_output))
    sys.stderr.write('\tstandard error: "{0}"\n'.format(ssh_agent_error))
    sys.exit(ssh_agent_error)

ssh_auth_sock = ssh_sock_re.group(1)
ssh_agent_pid = ssh_pid_re.group(1)

subprocess.run('set --export SSH_AUTH_SOCK {0}'.format(ssh_auth_sock))
subprocess.run('set --export SSH_AGENT_PID {0}'.format(ssh_agent_pid))
