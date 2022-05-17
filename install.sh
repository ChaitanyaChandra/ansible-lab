sudo python3 -m pip install ansible

cat > ~/.ssh/config << EOF
Host node1
Host node1
  HostName ec2-3-142-210-53.us-east-2.compute.amazonaws.com
  User ec2-user
  Port 22
  IdentityFile ~/.ssh/id_rsa
  StrictHostKeyChecking no
Host node2
  HostName ec2-3-136-236-230.us-east-2.compute.amazonaws.com
  User ec2-user
  Port 22
  IdentityFile ~/.ssh/id_rsa
  StrictHostKeyChecking no
Host node3
  HostName ec2-3-15-27-69.us-east-2.compute.amazonaws.com
  User ec2-user
  Port 22
  IdentityFile ~/.ssh/id_rsa
  StrictHostKeyChecking no
Host node4
  HostName ec2-18-224-110-251.us-east-2.compute.amazonaws.com
  User ec2-user
  Port 22
  IdentityFile ~/.ssh/id_rsa
  StrictHostKeyChecking no
Host node5
  HostName ec2-3-16-25-145.us-east-2.compute.amazonaws.com
  User ec2-user
  Port 22
  IdentityFile ~/.ssh/id_rsa
  StrictHostKeyChecking no
Host node6
  HostName ec2-18-119-97-123.us-east-2.compute.amazonaws.com
  User ec2-user
  Port 22
  IdentityFile ~/.ssh/id_rsa
  StrictHostKeyChecking no
EOF

cat > ~/.ssh/id_rsa << EOF
-----BEGIN RSA PRIVATE KEY-----
MIIG5AIBAAKCAYEAtBSYgMPONGLXcOpKBcJvK5AFviP2LK6m8nw90EkaUdl6FOPs
jqzlD88zW4BrbK3bw/dcE0vA0hzu/wPkDtgS3RtQ0+jjAPOwZNvqmTJYKdyyWs6B
T/hH6oo0x0vv6JqtPGNpyuLvKY5tpLBA49IVjurJN7dbzsiQtnM5lZQrOahTEFoL
1n5Fpyp/CTdYhJq4Dy3GgqcNhPCQbpQ1u4vgJICXQcs1j8XnHRyeXbCFBm6NviPg
k2Y2KPOo1kn9P5QUXuyIdzYNgpbDJnJBz/NjYc7iryZo6ry1ldGa7f2vHb9NbmB/
s3QN8XLoj34sC+9rJSjb4GXHzInJoiHFW38TIgtWzcHbpd3+swQPhCc3rfrkMzA/
eVYo5j0v4T796dKZDUDh2FDQh2B7k+A2Ajgux8WRlrYjhk2SybPcxWyg0sBbDB1s
i9hV/DQR9pslJiDKnGHUil1pMXg4IbmUqMnF5rS8faIdK3+h8c/nqSPR47RppGMW
/6gQhHC+TBDKEr63AgMBAAECggGAPUthWTrMnjIiiLGGfo1ez6IXAlA1Q6Iy+whk
9ddcGQ4AKsolw65/zTDGl1ePuQ84ZWx1r6+yMxJcGvsVDiRnz1Cz4106nyFTIhFk
ub5UGfOf1Z7CjxjAScm/CzMCttanLo3b/Y3ev/NVyJ+hhqoEYn/x+3/yxOCpuSBh
MlObnuV3WHJ94wVZ6ftiAB4RiBktmyUGk4QO6vgDAVB7NZn3shT+5wsm8Qf4kYUj
NlqV/Ml2f4iwsRsyRiAhkMbgZ1qcPgyMUZLFOS71e3iyO0rJiMwbpdbILcS672iN
D6HABZxur9rFu+7dcLH9LGG9+0cKJ0QPK63nEGWdV6TFHNAbfwP+NOhZlqaXzzOU
oMItOVpTPyBY6EoCohxPTmlGZ6Grzu+SvJgGhS2+PNyEljeIqE1LFu9lerDW8oCW
zCULzOVtx2D+AYb/yWwGO5RN6GaxDG8w1AutD9ZUG5x/No5YWU3Ndrh8c1UKbeKW
gn6SAfqa+cG5w5KRbfS7VDEsPfCBAoHBAOLPJB5MD9lYXroyPKi5MIrPl5c359m5
PlcRa5C+RHN/O9ahJU8D14nckb9+krWaiHszS4q65fZluivKLtJgLltJaTSaCHto
daRP9a0KyB90/Y7JMA0vv0traRRADejAtbBIQ6761INjQVv+zCLK8nhbGC4vLAR0
EKD8yINoy1SnRGS6ICcW4dIe3hVxzXHbowk3Zu81k970WlYDfeG5Bt26SKdL/Nng
8o+fb+RnFE23+gIFZMjmX/ClERO+EE7k9wKBwQDLQdkDXojA3wRrWlaoT8aftXwT
GGF0YxysV9CdT2VBbsj03Dhy9dlKqYpTMg5EqHBVlWk6CCzgRD4iEivStCNphOUh
RMMfQZmnhyCqLCWcAFV2fasCfUzDfedQ63bof5iCIHSdmqsVPCKgshSbhUG6l8ci
VUUhoR5S0LO8BTwUQv3swLXdk8ZaK5uyrTjBlk8ql3jffZ3l1LGrnekc9WBlDN/e
TS8uv92WcLrqN7m2S8ttqL6gs4RAClJxqf9PREECgcEAzagnxvUPNfPkSQ8+Y3sw
Yd2kRfDiYVCQD2DzWRa9eMC44H/UFZaVPSNsYOgDXXoXISc86zlXRZmuOwCkfgvK
XOnu5Ex7PnNUoL4ENXjeR2/MbklNMdfGrDtj14HRWuhKluKfxK0aP1yjqigar724
KJvpDA+n6Q3Y+jDcHBPMsyDMak0+1FLyRpXIqEc9k20lozjCNEsvnu2QcAfQf/lH
GYxNTq0fQ+yt5L8cNU2mYmZc4rJDVctW2RzDpFQl83O3AoHAHbVbLdXkcSRntfU3
U1SNuIxDPVtD60oNR9dyA3w2VZEGyFtj2NG8V+Bd+nkHgtuHx8qV3ciSHpl652n2
g86Wmna1Mt6lEm15MvZaPOVE/f9CfpYxp6R+0tgVNkukTqlPtj1eLicMOIdYnFpL
Dsw0ZjyG+6qw9xBgqUQd8S5msKN2D+O+8UsHI+jZ0gzljc4Vdik7npbyvEQRT/89
smDfHQX7trdbXR7oGXQSredFOrLrYfTXIA/9FYssr7ZkPcbBAoHBANpVdOcG2+fL
1x6+TDFWbplfrNKuVaU5FmNbtQPqnoSPYWiSaU95rLvPA3F0+so90qwr393ZQrM3
4rWpOVT7BRrOeN2ysUqBoB+GYcKAtnnnLniyWyKX8d9Q6cMYjADuJkYoVK0JmwtF
FWPYu8hZQH0HVK1NFVuOE16EeY6TQark+HutT40m0zUqIrCudXuFkXF+Hc6hPYdF
1wHcISAB1wqwHZg0UtjPslWUHkFtx/bDn0VKCiKgZeUtXIe1Ksnysw==
-----END RSA PRIVATE KEY-----
EOF

chmod 400 ~/.ssh/id_rsa 