FROM bcgovimages/aries-cloudagent:py36-1.16-1_0.8.1

ENV ACAPY_ADMIN_INSECURE_MODE="true" \
    ACAPY_AUTO_PROVISION="true" \
    ACAPY_DEBUG_CONNECTIONS="true" \
    ACAPY_ENDPOINT="http://localhost:9100" \
    ACAPY_LABEL="SSI-M" \
    ACAPY_LOG_LEVEL="info" \
    ACAPY_GENESIS_URL="hhttps://raw.githubusercontent.com/CarloSegat/free5gc-kubernetes-carlo/refs/heads/main/genesis.json" \
    ADMIN_PORT="9999" \
    AGENT_PORT="9100"

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "aca-py start \
    --admin '0.0.0.0' 9999 \
    --inbound-transport http '0.0.0.0' 9100 \
    --outbound-transport http  \
    --wallet-type askar \
    --wallet-name tub-wallet \
    --wallet-key tub-key \
    --preserve-exchange-records \
    --auto-provision \
    --public-invites \
    --auto-accept-invites \
    --seed 0123456789012345678901234567ssim \
    --requests-through-public-did \
    --auto-accept-requests \
    --auto-respond-credential-proposal \
    --auto-respond-credential-offer \
    --auto-respond-credential-request \
    --auto-respond-presentation-proposal \
    --auto-respond-presentation-request \
    --auto-store-credential \
    --auto-verify-presentation \
    --auto-ping-connection \
    --preserve-exchange-records \
    --invite-public \
    --log-level INFO"]

EXPOSE 9999 9100