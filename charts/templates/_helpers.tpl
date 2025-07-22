
{{- define "go-echo3bfd58f6-b231-482c-81e5-6fddfb467cfc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3bfd58f6-b231-482c-81e5-6fddfb467cfc.fullname" -}}
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


{{- define "go-echo3bfd58f6-b231-482c-81e5-6fddfb467cfc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3bfd58f6-b231-482c-81e5-6fddfb467cfc.labels" -}}
helm.sh/chart: {{ include "go-echo3bfd58f6-b231-482c-81e5-6fddfb467cfc.chart" . }}
{{ include "go-echo3bfd58f6-b231-482c-81e5-6fddfb467cfc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3bfd58f6-b231-482c-81e5-6fddfb467cfc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3bfd58f6-b231-482c-81e5-6fddfb467cfc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}