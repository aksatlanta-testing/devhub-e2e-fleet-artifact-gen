
{{- define "go-echo64898636-2e08-442e-9dd1-f479796a55bc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo64898636-2e08-442e-9dd1-f479796a55bc.fullname" -}}
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


{{- define "go-echo64898636-2e08-442e-9dd1-f479796a55bc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo64898636-2e08-442e-9dd1-f479796a55bc.labels" -}}
helm.sh/chart: {{ include "go-echo64898636-2e08-442e-9dd1-f479796a55bc.chart" . }}
{{ include "go-echo64898636-2e08-442e-9dd1-f479796a55bc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo64898636-2e08-442e-9dd1-f479796a55bc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo64898636-2e08-442e-9dd1-f479796a55bc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}