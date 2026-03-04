# Análisis Comprehensivo de Preguntas de Discusión — Attack Behavior Simulator

**Versión:** 2.0  
**Fecha de actualización:** 2026-03-04  
**Tiempo estimado de lectura:** 15–20 minutos

---

## Tabla de Contenidos

1. [Resumen Ejecutivo](#resumen-ejecutivo)
2. [P1: Probabilidad de Detección vs Riesgo General](#p1-probabilidad-de-detección-vs-riesgo-general)
3. [P2: Análisis de Sensibilidad](#p2-análisis-de-sensibilidad)
4. [P3: Porcentaje de Técnicas Observables](#p3-porcentaje-de-técnicas-observables)
5. [P4: Persistencia vs Evasión de Ejecución](#p4-persistencia-vs-evasión-de-ejecución)
6. [P5: Frecuencia por Etapa de Detección](#p5-frecuencia-por-etapa-de-detección)
7. [P6: Puntuación de Fidelidad de Simulación](#p6-puntuación-de-fidelidad-de-simulación)
8. [P7: Técnicas Más Observables](#p7-técnicas-más-observables)
9. [P8: Supuestos del Atacante por Fase](#p8-supuestos-del-atacante-por-fase)
10. [P9: Ataque Real vs Exposición Observable](#p9-ataque-real-vs-exposición-observable)
11. [Plan de Acción 12 Meses](#plan-de-acción-12-meses)
12. [Referencias y Bibliografía](#referencias-y-bibliografía)

---

## Resumen Ejecutivo

| # | Pregunta | Hallazgo Clave | Prioridad |
|---|----------|---------------|-----------:|
| P1 | Probabilidad de detección vs riesgo | Relación lineal inversa; cada 10% de detección reduce el riesgo un 10% | Alta |
| P2 | Análisis de sensibilidad | Mayor ROI en rango 50–75% de detección | Alta |
| P3 | Técnicas observables | 68% de observabilidad promedio; brechas críticas en Weaponization (20%) y C2 (50%) | Crítica |
| P4 | Persistencia vs evasión de ejecución | Persistencia es 28% más efectiva en evasión | Alta |
| P5 | Frecuencia por etapa de detección | 37% de detecciones en Delivery+Exploitation; brecha de 1–30 días en C2-Acciones | Crítica |
| P6 | Fidelidad de simulación | Score global 65–75%; limitado para APT sofisticados | Media |
| P7 | Técnicas más observables | Data Exfiltration (98%), Ransomware (95%), Resource Exploitation (90%) | Alta |
| P8 | Supuestos del atacante por fase | 6–7 supuestos críticos >60% probabilidad; requiere defensa en capas | Alta |
| P9 | Ataque real vs exposición observable | 6 criterios diferenciadores; árbol de decisión con escala de confianza 0–100% | Crítica |

---

## P1: Probabilidad de Detección vs Riesgo General

### Fórmula Matemática

```
Riesgo_Residual = Probabilidad_Amenaza × Impacto_Potencial × (1 − Tasa_Detección)
```

### Tabla de Impacto Cuantitativo

| Probabilidad de Detección (%) | Factor de Reducción | Riesgo Residual ($400K base) | Reducción vs 0% |
|------|------|------|------|
| 0 | 1.00 | $400,000 | 0% |
| 10 | 0.90 | $360,000 | 10% |
| 25 | 0.75 | $300,000 | 25% |
| 50 | 0.50 | $200,000 | 50% |
| 75 | 0.25 | $100,000 | 75% |
| 90 | 0.10 | $40,000 | 90% |
| 99 | 0.01 | $4,000 | 99% |

### Caso de Estudio: Ransomware

**Contexto:** Manufactura mediana, infraestructura on-premise/cloud

**Parámetros:**
- Vector: Spear phishing (15% click rate)
- Tiempo cifrado: 4-8 horas
- Impacto: $2.1M

**Escenarios de Detección:**

| Escenario | Detección | Riesgo Residual | Respuesta |
|---|---|---|---|
| Sin controles | 15% | $1,785,000 | >24h |
| EDR básico | 45% | $1,155,000 | 4-8h |
| EDR + SIEM | 72% | $588,000 | 30-90min |
| EDR + SIEM + NDR | 91% | $189,000 | <15min |

**Hallazgos:** Relación lineal 1:1 entre detección y riesgo.

---

## P2: Análisis de Sensibilidad

### Matriz por Rangos

| Rango | Reducción por 1% | Costo | ROI |
|---|---|---|---|
| 0-25% | Muy alta | Bajo | Muy alto |
| 25-50% | Alta | Moderado | Alto |
| 50-75% | Moderada-alta | Moderado-alto | Alto |
| 75-100% | Baja | Alto | Bajo |

**Recomendación:** Priorizar llevar detección a 75% para máximo ROI.

---

## P3: Porcentaje de Técnicas Observables

### Observabilidad Promedio Global: 68%

| Fase | Observables | Débiles | No Observable |
|---|---|---|---|
| Reconnaissance | 45% | 30% | 25% |
| Weaponization | 20% | 30% | 50% |
| Delivery | 82% | 12% | 6% |
| Exploitation | 75% | 15% | 10% |
| Installation | 64% | 20% | 16% |
| C2 | 50% | 28% | 22% |
| Actions | 88% | 8% | 4% |

**Brechas Críticas:** Weaponization (20%) y C2 (50%)

---

## P4: Persistencia vs Evasión de Ejecución

| Método | Evasión | Detección |
|---|---|---|
| Registry Run Keys | 78% | Media |
| Scheduled Tasks | 82% | Media-Alta |
| WMI Subscriptions | 89% | Baja |
| PowerShell ofuscado | 62% | Media-Alta |
| Living-off-the-land | 71% | Media |
| Process Injection | 74% | Baja-Media |

**Análisis:** Persistencia (82%) es 28% más efectiva que ejecución (64%)

**Defensa:** FIM, Registry monitoring, WMI auditing, AppLocker

---

## P5: Frecuencia por Etapa de Detección

| Fase | % Detecciones | Tiempo |
|---|---|---|
| Delivery | 18% | Minutos |
| Exploitation | 19% | Minutos-Horas |
| C2 | 12% | Días |
| Actions | 30% | Días-Semanas |

**Hallazgo:** 37% en Delivery+Exploitation, brecha 1-30 días en C2

---

## P6: Puntuación de Fidelidad de Simulación

**Score Global: 65-75%**

**Fortalezas (>80%):**
- Ransomware: 85%
- PowerShell/WMI: 82%
- Exfiltración: 83%

**Debilidades (<60%):**
- APT sofisticado: 40%
- Zero-days: 30%
- Supply chain: 45%

---

## P7: Técnicas Más Observables

| Posición | Técnica | Observabilidad |
|---|---|---|
| 1 | Data Exfiltration | 98% |
| 2 | Ransomware | 95% |
| 3 | Resource Exploitation | 90% |
| 4 | Usuarios privilegiados | 87% |
| 5 | Pass-the-Hash | 83% |
| 6 | PowerShell no firmado | 79% |
| 7 | C2 HTTP/S | 74% |
| 8 | Spearphishing | 72% |
| 9 | Process Injection | 68% |
| 10 | Scheduled Tasks | 61% |
| 11 | WMI Subscription | 45% |
| 12 | DNS Tunneling | 38% |

---

## P8: Supuestos del Atacante por Fase

### Supuestos Críticos (>60%)

1. Usuario hará clic (65%) → SAT + Phishing simulations
2. Gateway no detectará (70%) → Email sandbox
3. Vulnerabilidad existe (72%) → Patch management <30 días
4. Sin monitoreo host (60%) → EDR comportamiento
5. Permisos disponibles (68%) → Least Privilege + PAM
6. Logs no revisados (75%) → SIEM activo 24/7
7. Tiempo para respuesta (80%) → IR playbooks + SOAR

**Conclusión:** Requiere defensa en capas múltiples

---

## P9: Ataque Real vs Exposición Observable

### 6 Criterios Diferenciadores

| Criterio | Ataque Real | Legítimo |
|---|---|---|
| Intencionalidad | Dirigido a activos valiosos | Acceso según flujo trabajo |
| Velocidad | Anómala vs baseline | Consistente con historial |
| Timing | Fuera horario/festivos | Alineado con laboral |
| Geografía | IPs no habituales/proxies | Ubicaciones conocidas |
| Encadenamiento | Patrón MITRE ATT&CK | Eventos aislados |
| Respuesta | Escalada táctica al detectar | Sin cambios |

### Escala de Confianza

| Nivel | Rango | Acción |
|---|---|---|
| Sin evidencia | 0-20% | Monitoreo pasivo |
| Sospechoso | 21-40% | Investigación L1 |
| Probable | 41-60% | Escalada L2 |
| Alto | 61-80% | IR playbook |
| Casi confirmado | 81-94% | Contención activa |
| Confirmado | 95-100% | Respuesta completa |

### Casos de Estudio

**Caso A - Data Breach (100% confianza):**
- Exfiltración 2.3M registros
- Queries masivos fuera horario
- Conexión a IP Rusia
- Webshell detectada
- Veredicto: ATAQUE CONFIRMADO

**Caso B - Backup Rutinario (0% confianza):**
- 850GB entre 23:00-02:30
- Usuario svc_backup documentado
- Ventana mantenimiento ITSM
- Hash coincide backup anterior
- Veredicto: ACTIVIDAD LEGÍTIMA

**Caso C - APT Probable (75% confianza):**
- Acceso archivos CAD clasificados
- Volumen 340% sobre baseline
- PowerShell base64 codificado
- Dominio registrado 3 semanas atrás
- No hay malware EDR
- Veredicto: APT PROBABLE

---

## Plan de Acción 12 Meses

### Q1: Fundamentos
- Simulación ABS baseline
- Auditar logging >95%
- Reglas SIEM P7
- SAT + phishing simulations
- Canary files
- Patch management <30d

### Q2: Detección
- Beaconing + DNS analytics
- FIM + Registry monitoring
- IR playbooks
- DLP en egress
- Simulación ABS mejora
- Escalación <30min

### Q3: Madurez
- UEBA usuarios privilegio
- Threat hunting quincenal
- TI feeds automatizados
- Least Privilege + PAM
- SOAR respuesta <60min
- Auditoría supuestos atacante

### Q4: Mejora Continua
- Simulación ABS APT fidelity
- Análisis sensibilidad inversión
- Ejercicio tabletop IR
- Actualizar documentación
- Métricas anuales DTTD/MTTR
- Roadmap 2027

---

## Referencias y Bibliografía

1. MITRE ATT&CK Framework v14 (2024)
2. Mandiant M-Trends 2024
3. NIST SP 800-61r3
4. CIS Controls v8
5. SANS Detection and Response Metrics
6. Verizon DBIR 2024
7. Lockheed Martin Cyber Kill Chain
8. OWASP Testing Guide v4.2
9. NIST Cybersecurity Framework 2.0
10. Gartner SOAR Market Guide
11. IBM Cost of Data Breach 2024
12. FIRST CVSS v4.0