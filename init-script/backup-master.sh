pg_basebackup -D /var/lib/postgresql/data-slave -S "$REPLICATION_SLOT_NAME" -X stream -P -U replicator -Fp -R
