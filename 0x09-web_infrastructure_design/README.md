# Simple Web Infrastructure - Single Server Setup

## Overview

This document explains a basic web infrastructure using a single server with a LAMP-like stack to host `www.foobar.com`. This setup demonstrates fundamental web hosting concepts while highlighting the limitations of single-server architectures.

## Architecture Components

### Infrastructure Specifications
- **Server Count**: 1
- **IP Address**: 8.8.8.8
- **Domain**: `foobar.com` with `www` subdomain
- **Web Server**: Nginx
- **Application Server**: PHP-FPM/Python/Node.js
- **Database**: MySQL
- **Operating System**: Linux

## How It Works

### User Request Flow
1. User enters `www.foobar.com` in browser
2. DNS lookup resolves domain to IP `8.8.8.8`
3. Browser sends HTTP request to server
4. Nginx receives and processes the request
5. Static files served directly, dynamic requests forwarded to application server
6. Application server processes business logic and queries database
7. Response sent back through Nginx to user's browser

## Component Roles

### Server
**Definition**: A computer system that provides services to other computers over a network.

**Function**: 
- Hosts all application components
- Provides computational resources (CPU, RAM, storage)
- Maintains network connectivity
- Runs operating system and software stack

### Domain Name System
**Role**: Translates human-readable domain names to IP addresses.

**DNS Record Type**: 
- `www.foobar.com` uses either:
  - **A Record**: Direct mapping to IP address `8.8.8.8`
  - **CNAME Record**: Canonical name pointing to main domain

### Web Server (Nginx)
**Primary Functions**:
- Accept incoming HTTP/HTTPS requests
- Serve static content (HTML, CSS, JavaScript, images)
- Reverse proxy for application server
- Handle SSL/TLS termination
- Manage connection pooling
- Implement basic security filters

**Port**: Typically 80 (HTTP) and 443 (HTTPS)

### Application Server
**Responsibilities**:
- Execute application business logic
- Process dynamic content requests
- Handle user authentication and authorization
- Manage session state
- Interface with database layer
- Generate dynamic HTML/JSON responses

**Common Technologies**: PHP-FPM, Python WSGI, Node.js, Ruby on Rails

### Database (MySQL)
**Core Functions**:
- Persistent data storage
- Data integrity enforcement
- CRUD operations (Create, Read, Update, Delete)
- Transaction management
- User and content management
- Query optimization

**Port**: 3306 (default MySQL port)

### Application Files
**Contents**:
- Source code and scripts
- Configuration files
- Static assets
- Templates and views
- Dependencies and libraries

**Typical Location**: `/var/www/html` or `/opt/app`

## Communication Protocol

**Primary Protocol**: HTTP/HTTPS over TCP/IP

**Why TCP/IP**:
- Reliable data transmission
- Error detection and correction
- Ordered packet delivery
- Universal internet standard

## Infrastructure Limitations

### 1. Single Point of Failure (SPOF)

**Problem**: The entire system depends on one server.

**Risk Scenarios**:
- Hardware failure (CPU, RAM, storage, network card)
- Operating system crashes
- Power outages
- Network connectivity issues
- Data center problems

**Impact**: Complete website unavailability during failures.

### 2. Maintenance Downtime

**Problematic Operations**:
- **Code Deployments**: Require application server restarts
- **Database Migrations**: May need system downtime
- **Security Updates**: Often require server reboots
- **Configuration Changes**: Service restarts interrupt availability
- **Backup Operations**: Can impact performance

**Consequences**: 
- User experience disruption
- Revenue loss during downtime
- SEO impact from unavailability

### 3. Scalability Constraints

**Resource Limitations**:

#### CPU Bottlenecks
- Fixed processing power
- Cannot handle traffic spikes
- Limited concurrent request processing

#### Memory Constraints
- Fixed RAM allocation
- Application and database compete for memory
- Performance degradation under load

#### Storage Limitations
- Finite disk space
- Database growth constraints
- File upload limitations

#### Network Bandwidth
- Single connection point
- Limited throughput capacity
- Shared bandwidth between all services

#### Concurrency Issues
- Maximum simultaneous connections
- Database connection pool limits
- Application server thread/process limits

## Scaling Challenges

### Traffic Growth Problems
- Cannot distribute load across multiple servers
- Performance degrades linearly with user increase
- No horizontal scaling capabilities
- Cache limitations on single server

### Geographic Limitations
- Single server location increases latency for distant users
- No content distribution network (CDN) integration
- Regional availability issues

## Best Practices for This Setup

### Monitoring
- Implement server monitoring (CPU, RAM, disk usage)
- Application performance monitoring
- Database performance tracking
- Uptime monitoring

### Backup Strategy
- Regular automated backups
- Database dump scheduling
- Application code versioning
- Configuration backup

### Security Measures
- Regular security updates
- Firewall configuration
- SSL certificate management
- Access logging and monitoring

## Evolution Path

### Next Steps for Scalability
1. **Load Balancer**: Distribute traffic across multiple servers
2. **Database Replication**: Master-slave setup for read scaling
3. **Caching Layer**: Redis/Memcached for performance
4. **CDN Integration**: Geographic content distribution
5. **Microservices**: Service separation and scaling
6. **Container Orchestration**: Docker and Kubernetes deployment

## Conclusion

While this single-server architecture serves as an excellent learning foundation and works for small-scale applications, production systems require more robust, scalable, and fault-tolerant designs. Understanding these limitations is crucial for planning infrastructure evolution as applications grow.

---

**Target Use Cases**: 
- Development environments
- Small business websites
- Prototype applications
- Learning and educational purposes

**Not Suitable For**:
- High-traffic production applications
- Mission-critical business systems
- Applications requiring high availability
- Geographically distributed user bases