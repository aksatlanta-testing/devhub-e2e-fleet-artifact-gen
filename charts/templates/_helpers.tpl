
{{- define "go-echo002074a7-af6a-49a1-9825-6049c4f9bcfb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo002074a7-af6a-49a1-9825-6049c4f9bcfb.fullname" -}}
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


{{- define "go-echo002074a7-af6a-49a1-9825-6049c4f9bcfb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo002074a7-af6a-49a1-9825-6049c4f9bcfb.labels" -}}
helm.sh/chart: {{ include "go-echo002074a7-af6a-49a1-9825-6049c4f9bcfb.chart" . }}
{{ include "go-echo002074a7-af6a-49a1-9825-6049c4f9bcfb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo002074a7-af6a-49a1-9825-6049c4f9bcfb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo002074a7-af6a-49a1-9825-6049c4f9bcfb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}