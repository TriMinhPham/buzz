-- Single-use relay invites: each code's random nonce is consumed on its first
-- successful claim. A second presentation of the same code (by a different
-- pubkey, or by a removed ex-member) is rejected as invite_used. The token
-- itself stays stateless — this table only records consumption.
CREATE TABLE relay_invite_claims (
    community_id UUID NOT NULL,
    nonce        TEXT NOT NULL,
    claimed_by   TEXT NOT NULL,
    claimed_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (community_id, nonce)
);
