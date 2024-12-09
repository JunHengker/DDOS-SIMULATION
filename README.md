# DDOS Simulation and Mitigation on Docker
This project simulates a DDoS attack and demonstrates mitigation strategies using Docker containers. The attack simulation is powered by tools like ApacheBench, Python scripts, and Shell scripts. The mitigation layer (Intrusion Prevention System, IPS) is implemented within the Docker environment using technologies such as Alpine, Nginx, Docker Swarm, and other tools.

## Features
- **DDoS Attack Simulation**: Simulates a DDoS attack using ApacheBench (`ab`) to generate traffic and overwhelm a target server.
- **Mitigation Layer**: Implements Intrusion Prevention System (IPS) using custom Python scripts for traffic analysis and mitigation.
- **Docker Containers**: Uses Docker to create isolated environments for both the attacker and victim, and deploys them using Docker Swarm for orchestration.
- **Nginx**: Acts as the web server to simulate a real-world scenario of a victim server under attack.
- **Alpine**: A lightweight Linux distribution used to reduce the size of the Docker images.
- **Benchmarking**: Utilizes ApacheBench (`ab`) to generate traffic and measure server performance.

## Project Structure
DDOS-SIMULATION/
├── attacker/
│   ├── Dockerfile
│   ├── attack_script.py
│   └── run_attack.sh
├── victim/
│   ├── Dockerfile
│   ├── nginx.conf
│   └── index.html
├── mitigation/
│   ├── mitigation_script.py
│   └── Dockerfile
├── docker-compose.yml
├── README.md
└── swarm_deployment.yml

### Directories and Files
- **attacker/**: Contains the Docker image and scripts used for simulating the DDoS attack.
    - `Dockerfile`: Defines the image for the attacker.
    - `attack_script.py`: Python script to initiate a DDoS attack.
    - `run_attack.sh`: Shell script to run the attack simulation.
  
- **victim/**: Contains the Docker image of the victim server running Nginx to simulate a real-world service under attack.
    - `Dockerfile`: Defines the Docker image for the victim server.
    - `nginx.conf`: Configuration file for Nginx.
    - `index.html`: A simple HTML page served by Nginx.

- **mitigation/**: Contains the Docker image for the mitigation or IPS system.
    - `mitigation_script.py`: Python script to mitigate or prevent the attack.
    - `Dockerfile`: Defines the image for the mitigation system.

- **docker-compose.yml**: A Docker Compose file that simplifies the process of starting all services locally.

- **swarm_deployment.yml**: A Docker Swarm deployment file for scaling the services in a cluster.

## Getting Started

To simulate a DDoS attack and apply mitigation using Docker, follow these steps:

### Prerequisites

- Docker (and Docker Compose) installed on your machine.
- Docker Swarm set up if you're planning to use the orchestration feature.

### 1. Clone the repository
```bash
git clone https://github.com/JunHengker/DDOS-SIMULATION.git
cd DDOS-SIMULATION
```

### 2. Build the Docker images
Navigate to each folder (`attacker`, `victim`, and `mitigation`) and build the images using Docker:
```bash
docker build -t attacker-image ./attacker
docker build -t victim-image ./victim
docker build -t mitigation-image ./mitigation
```

### 3. Run the Simulation (Local Mode)
Use Docker Compose to start the services:
```bash
docker-compose up
```
This will start the attacker, victim, and mitigation containers. The attacker will begin sending requests to the victim server.

### 4. Run the DDoS Attack
Once the containers are running, execute the attack:
```bash
docker exec -it attacker-container bash
./run_attack.sh
```

### 5. Monitor the Mitigation
You can monitor how the mitigation system (IPS) is handling the attack by viewing the logs:
```bash
docker logs -f mitigation-container
```

### 6. Scaling with Docker Swarm (Optional)
To scale the simulation, you can use Docker Swarm. Initialize Docker Swarm:
```bash
docker swarm init
```
Then deploy the services defined in `swarm_deployment.yml`:
```bash
docker stack deploy -c swarm_deployment.yml ddos-simulation
```

This will deploy your attacker, victim, and mitigation services in a Docker Swarm cluster for improved scalability.

## Technologies Used
- **Docker**: Containerization platform for creating isolated environments.
- **Nginx**: Web server to simulate the victim server.
- **Alpine**: A minimal Docker image for the attacker and victim services.
- **Python**: For custom scripts to handle the DDoS attack and mitigation logic.
- **Shell**: Used for running attack scripts.
- **Docker Swarm**: For orchestrating the containers in a production-like environment.

## Known Issues
- **Performance Impact**: Running a DDoS simulation, especially with large traffic volumes, may impact system performance. It's recommended to run this on a system with sufficient resources.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements
- ApacheBench for benchmarking the DDoS attack.
- Docker and Docker Compose for container orchestration.
- Nginx for simulating a real-world web server.

### Key Points:
1. **Attack Simulation**: Describes the attacker container that uses ApacheBench or custom scripts to simulate the attack.
2. **Mitigation**: Describes the mitigation container that runs Python scripts or IPS tools to prevent the DDoS attack.
3. **Docker and Docker Compose**: Explains how to use Docker to run the simulation in isolated environments.
4. **Swarm Deployment**: Mentions how to scale the system using Docker Swarm for more complex, distributed simulations.
