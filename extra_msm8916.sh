#!/bin/bash

cat <<EOF >> target/linux/msm89xx/config-6.1
CONFIG_BT_QCOMSMD=m
CONFIG_QCOM_IPA=m
EOF

cat <<EOF >> target/linux/msm89xx/config-6.6
CONFIG_BT_QCOMSMD=m
CONFIG_QCOM_IPA=m
EOF

cat <<EOF >> target/linux/msm89xx/config-6.12
CONFIG_BT_QCOMSMD=m
CONFIG_QCOM_IPA=m
EOF
