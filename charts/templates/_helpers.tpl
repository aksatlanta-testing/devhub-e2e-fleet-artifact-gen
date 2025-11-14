
{{- define "go-echo8cb0b373-5cb2-4f45-b7df-633bfdfbaefe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8cb0b373-5cb2-4f45-b7df-633bfdfbaefe.fullname" -}}
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


{{- define "go-echo8cb0b373-5cb2-4f45-b7df-633bfdfbaefe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8cb0b373-5cb2-4f45-b7df-633bfdfbaefe.labels" -}}
helm.sh/chart: {{ include "go-echo8cb0b373-5cb2-4f45-b7df-633bfdfbaefe.chart" . }}
{{ include "go-echo8cb0b373-5cb2-4f45-b7df-633bfdfbaefe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8cb0b373-5cb2-4f45-b7df-633bfdfbaefe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8cb0b373-5cb2-4f45-b7df-633bfdfbaefe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}