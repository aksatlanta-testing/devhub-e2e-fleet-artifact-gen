
{{- define "go-echo48f07aff-b975-46bf-ae63-d6be1981c243.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48f07aff-b975-46bf-ae63-d6be1981c243.fullname" -}}
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


{{- define "go-echo48f07aff-b975-46bf-ae63-d6be1981c243.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48f07aff-b975-46bf-ae63-d6be1981c243.labels" -}}
helm.sh/chart: {{ include "go-echo48f07aff-b975-46bf-ae63-d6be1981c243.chart" . }}
{{ include "go-echo48f07aff-b975-46bf-ae63-d6be1981c243.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo48f07aff-b975-46bf-ae63-d6be1981c243.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo48f07aff-b975-46bf-ae63-d6be1981c243.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}