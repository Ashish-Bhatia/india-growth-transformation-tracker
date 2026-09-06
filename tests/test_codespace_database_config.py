import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEVCONTAINER = ROOT / ".devcontainer" / "devcontainer.json"
COMPOSE = ROOT / "docker-compose.yml"


def test_codespace_devcontainer_declares_postgres_16_and_database_url():
    config = json.loads(DEVCONTAINER.read_text(encoding="utf-8"))
    assert config["dockerComposeFile"] == "../docker-compose.yml"
    assert config["service"] == "app"
    assert config["containerEnv"]["DATABASE_URL"] == "postgresql://tracker:tracker@localhost:5432/igt_tracker"
    assert config["forwardPorts"] == [5432]


def test_codespace_compose_matches_ci_database_contract():
    compose = COMPOSE.read_text(encoding="utf-8")
    assert "image: postgres:16" in compose
    assert "POSTGRES_USER: tracker" in compose
    assert "POSTGRES_PASSWORD: tracker" in compose
    assert "POSTGRES_DB: igt_tracker" in compose
    assert "pg_isready -U tracker -d igt_tracker" in compose
    assert "network_mode: service:db" in compose
