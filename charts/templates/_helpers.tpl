
{{- define "go-echo0b931df5-5884-47cd-b7aa-f36f0b92b3af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b931df5-5884-47cd-b7aa-f36f0b92b3af.fullname" -}}
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


{{- define "go-echo0b931df5-5884-47cd-b7aa-f36f0b92b3af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b931df5-5884-47cd-b7aa-f36f0b92b3af.labels" -}}
helm.sh/chart: {{ include "go-echo0b931df5-5884-47cd-b7aa-f36f0b92b3af.chart" . }}
{{ include "go-echo0b931df5-5884-47cd-b7aa-f36f0b92b3af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0b931df5-5884-47cd-b7aa-f36f0b92b3af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0b931df5-5884-47cd-b7aa-f36f0b92b3af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}