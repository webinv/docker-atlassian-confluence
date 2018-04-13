#!/bin/bash
set -e

if [ "$1" = 'start-confluence.sh' ]; then
    if [ -z "$(getent passwd $RUN_USER)" ]; then
      echo "Creating user $RUN_USER:$RUN_GROUP"

      groupadd --gid ${RUN_GROUP_GID} -r ${RUN_GROUP} && \
      useradd -r --uid ${RUN_USER_UID} -g ${RUN_GROUP} -d ${CONFLUENCE_INSTALL_DIR} ${RUN_USER}
      chown -R ${RUN_USER}:${RUN_GROUP} ${CONFLUENCE_HOME} ${CONFLUENCE_INSTALL_DIR}
    fi

	exec gosu "${RUN_USER}:${RUN_GROUP}" "$@"
fi

exec "$@"