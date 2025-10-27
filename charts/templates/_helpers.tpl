
{{- define "go-echo0a58368b-3b88-4b9b-84cb-71145695980e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0a58368b-3b88-4b9b-84cb-71145695980e.fullname" -}}
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


{{- define "go-echo0a58368b-3b88-4b9b-84cb-71145695980e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0a58368b-3b88-4b9b-84cb-71145695980e.labels" -}}
helm.sh/chart: {{ include "go-echo0a58368b-3b88-4b9b-84cb-71145695980e.chart" . }}
{{ include "go-echo0a58368b-3b88-4b9b-84cb-71145695980e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0a58368b-3b88-4b9b-84cb-71145695980e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0a58368b-3b88-4b9b-84cb-71145695980e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}