
{{- define "go-echo8a0d3ac9-024c-4e9e-bc9d-cff0d82d27da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a0d3ac9-024c-4e9e-bc9d-cff0d82d27da.fullname" -}}
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


{{- define "go-echo8a0d3ac9-024c-4e9e-bc9d-cff0d82d27da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a0d3ac9-024c-4e9e-bc9d-cff0d82d27da.labels" -}}
helm.sh/chart: {{ include "go-echo8a0d3ac9-024c-4e9e-bc9d-cff0d82d27da.chart" . }}
{{ include "go-echo8a0d3ac9-024c-4e9e-bc9d-cff0d82d27da.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8a0d3ac9-024c-4e9e-bc9d-cff0d82d27da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8a0d3ac9-024c-4e9e-bc9d-cff0d82d27da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}