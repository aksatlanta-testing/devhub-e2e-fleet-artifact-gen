
{{- define "go-echo412ee3a9-06a9-4173-ad77-403288c2e3ba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo412ee3a9-06a9-4173-ad77-403288c2e3ba.fullname" -}}
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


{{- define "go-echo412ee3a9-06a9-4173-ad77-403288c2e3ba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo412ee3a9-06a9-4173-ad77-403288c2e3ba.labels" -}}
helm.sh/chart: {{ include "go-echo412ee3a9-06a9-4173-ad77-403288c2e3ba.chart" . }}
{{ include "go-echo412ee3a9-06a9-4173-ad77-403288c2e3ba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo412ee3a9-06a9-4173-ad77-403288c2e3ba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo412ee3a9-06a9-4173-ad77-403288c2e3ba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}