
{{- define "go-echoffd92281-1143-4e2a-a5f1-3bbc09db1f0a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffd92281-1143-4e2a-a5f1-3bbc09db1f0a.fullname" -}}
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


{{- define "go-echoffd92281-1143-4e2a-a5f1-3bbc09db1f0a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffd92281-1143-4e2a-a5f1-3bbc09db1f0a.labels" -}}
helm.sh/chart: {{ include "go-echoffd92281-1143-4e2a-a5f1-3bbc09db1f0a.chart" . }}
{{ include "go-echoffd92281-1143-4e2a-a5f1-3bbc09db1f0a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoffd92281-1143-4e2a-a5f1-3bbc09db1f0a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoffd92281-1143-4e2a-a5f1-3bbc09db1f0a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}