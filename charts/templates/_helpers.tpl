
{{- define "go-echoe72898b5-7b61-44a7-9bd8-7b65f0d3e2cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe72898b5-7b61-44a7-9bd8-7b65f0d3e2cb.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoe72898b5-7b61-44a7-9bd8-7b65f0d3e2cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe72898b5-7b61-44a7-9bd8-7b65f0d3e2cb.labels" -}}
helm.sh/chart: {{ include "go-echoe72898b5-7b61-44a7-9bd8-7b65f0d3e2cb.chart" . }}
{{ include "go-echoe72898b5-7b61-44a7-9bd8-7b65f0d3e2cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe72898b5-7b61-44a7-9bd8-7b65f0d3e2cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe72898b5-7b61-44a7-9bd8-7b65f0d3e2cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}