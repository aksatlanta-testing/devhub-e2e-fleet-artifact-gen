
{{- define "go-echo0a3c7f0d-67df-472d-af44-542d6d45da7c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0a3c7f0d-67df-472d-af44-542d6d45da7c.fullname" -}}
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


{{- define "go-echo0a3c7f0d-67df-472d-af44-542d6d45da7c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0a3c7f0d-67df-472d-af44-542d6d45da7c.labels" -}}
helm.sh/chart: {{ include "go-echo0a3c7f0d-67df-472d-af44-542d6d45da7c.chart" . }}
{{ include "go-echo0a3c7f0d-67df-472d-af44-542d6d45da7c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0a3c7f0d-67df-472d-af44-542d6d45da7c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0a3c7f0d-67df-472d-af44-542d6d45da7c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}