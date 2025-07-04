
{{- define "go-echobbf608c5-bca3-4915-92b1-3fd4c9d10218.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbf608c5-bca3-4915-92b1-3fd4c9d10218.fullname" -}}
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


{{- define "go-echobbf608c5-bca3-4915-92b1-3fd4c9d10218.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbf608c5-bca3-4915-92b1-3fd4c9d10218.labels" -}}
helm.sh/chart: {{ include "go-echobbf608c5-bca3-4915-92b1-3fd4c9d10218.chart" . }}
{{ include "go-echobbf608c5-bca3-4915-92b1-3fd4c9d10218.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobbf608c5-bca3-4915-92b1-3fd4c9d10218.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobbf608c5-bca3-4915-92b1-3fd4c9d10218.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}