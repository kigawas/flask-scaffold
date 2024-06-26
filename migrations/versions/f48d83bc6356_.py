"""empty message

Revision ID: f48d83bc6356
Revises:
Create Date: 2018-10-31 17:56:30.705345

"""

import sqlalchemy as sa
from alembic import op

# revision identifiers, used by Alembic.
revision = "f48d83bc6356"
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table(
        "table",
        sa.Column("id", sa.Integer(), nullable=False),
        sa.Column("hash", sa.String(length=64), nullable=False),
        sa.PrimaryKeyConstraint("id"),
        sa.UniqueConstraint("hash"),
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table("table")
    # ### end Alembic commands ###
