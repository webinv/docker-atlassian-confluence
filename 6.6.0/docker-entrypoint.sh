#!/bin/bash
set -e

if [ "$1" = 'start-confluence.sh' ]; then
    if [ -z "$(getent passwd $RUN_USER)" ]; then
      echo "Creating user $RUN_USER:$RUN_GROUP"

      groupadd --gid ${RUN_GROUP_GID} -r ${RUN_GROUP} && \
      useradd -r --uid ${RUN_USER_UID} -g ${RUN_GROUP} -d ${CONFLUENCE_INSTALL_DIR} ${RUN_USER}

      chown -R root:root ${CONFLUENCE_INSTALL_DIR}
      chmod -R 755 ${CONFLUENCE_INSTALL_DIR}
      chmod -R 700 ${CONFLUENCE_INSTALL_DIR}/conf/Catalina
      chmod -R 700 ${CONFLUENCE_INSTALL_DIR}/logs
      chmod -R 700 ${CONFLUENCE_INSTALL_DIR}/temp
      chmod -R 700 ${CONFLUENCE_INSTALL_DIR}/work
      chown -R ${RUN_USER}:${RUN_GROUP} ${CONFLUENCE_INSTALL_DIR}/logs
      chown -R ${RUN_USER}:${RUN_GROUP} ${CONFLUENCE_INSTALL_DIR}/temp
      chown -R ${RUN_USER}:${RUN_GROUP} ${CONFLUENCE_INSTALL_DIR}/work
      chown -R ${RUN_USER}:${RUN_GROUP} ${CONFLUENCE_INSTALL_DIR}/conf
      chown -R ${RUN_USER}:${RUN_GROUP} ${CONFLUENCE_HOME}
    fi

	exec gosu "${RUN_USER}:${RUN_GROUP}" "$@"
fi

exec "$@"