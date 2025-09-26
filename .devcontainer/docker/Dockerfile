FROM debian:latest

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		ca-certificates \
		bash \
		git \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -fsSL https://mise.run | sh \
	&& ~/.local/bin/mise --version || true

ENV PATH="/root/.local/bin:${PATH}"

RUN echo 'eval "$(/root/.local/bin/mise activate bash)"' > /etc/profile.d/mise.sh \
	&& chmod +x /etc/profile.d/mise.sh || true \
	&& echo 'eval "$(/root/.local/bin/mise activate bash)"' >> /root/.bashrc

# Provide a convenient py-init() helper for initializing a mise Python
# environment. Place it in /etc/profile.d so login shells get it, export
# the function so child bash processes see it, and set BASH_ENV so
# non-interactive bash shells source it too. Also source it from
# /root/.bashrc to ensure interactive non-login shells get it.
RUN printf '%s\n' \
  'py-init() {' \
  '  if [ -z "$1" ]; then' \
  '    echo "Error: Please provide a Python version."' \
  '    echo "Example: py-init 3.11"' \
  '    return 1' \
  '  fi' \
  '  ' \
  '  echo "Initializing mise Python environment for version $1..."' \
  '  ' \
  '  touch ./mise.toml' \
  '  mise use python@$1' \
  '  mise config set env._.python.venv.path .venv' \
  '  mise config set env._.python.venv.create true' \
  '  ' \
  '  echo "Setup complete."' \
  '}' \
  'export -f py-init' \
  > /etc/profile.d/py-init.sh

RUN chmod 0755 /etc/profile.d/py-init.sh \
		&& echo 'source /etc/profile.d/py-init.sh' >> /root/.bashrc || true

# Ensure non-interactive bash shells source the py-init helper
ENV BASH_ENV=/etc/profile.d/py-init.sh

RUN /root/.local/bin/mise use --global python@3.13

WORKDIR /workspace

CMD ["bash"]
