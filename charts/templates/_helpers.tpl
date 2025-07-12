
{{- define "go-echo15b1d2df-38ec-46a1-ae65-c7f99f4ec9cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15b1d2df-38ec-46a1-ae65-c7f99f4ec9cb.fullname" -}}
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


{{- define "go-echo15b1d2df-38ec-46a1-ae65-c7f99f4ec9cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15b1d2df-38ec-46a1-ae65-c7f99f4ec9cb.labels" -}}
helm.sh/chart: {{ include "go-echo15b1d2df-38ec-46a1-ae65-c7f99f4ec9cb.chart" . }}
{{ include "go-echo15b1d2df-38ec-46a1-ae65-c7f99f4ec9cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo15b1d2df-38ec-46a1-ae65-c7f99f4ec9cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo15b1d2df-38ec-46a1-ae65-c7f99f4ec9cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}