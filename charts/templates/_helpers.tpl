
{{- define "go-echoff53f9e7-c50d-4b49-9607-d3e269b2b3d2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff53f9e7-c50d-4b49-9607-d3e269b2b3d2.fullname" -}}
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


{{- define "go-echoff53f9e7-c50d-4b49-9607-d3e269b2b3d2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff53f9e7-c50d-4b49-9607-d3e269b2b3d2.labels" -}}
helm.sh/chart: {{ include "go-echoff53f9e7-c50d-4b49-9607-d3e269b2b3d2.chart" . }}
{{ include "go-echoff53f9e7-c50d-4b49-9607-d3e269b2b3d2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff53f9e7-c50d-4b49-9607-d3e269b2b3d2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff53f9e7-c50d-4b49-9607-d3e269b2b3d2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}