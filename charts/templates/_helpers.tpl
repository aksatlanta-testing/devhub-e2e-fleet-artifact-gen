
{{- define "go-echodea5f3b3-aec6-4220-ade9-184889369ecd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodea5f3b3-aec6-4220-ade9-184889369ecd.fullname" -}}
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


{{- define "go-echodea5f3b3-aec6-4220-ade9-184889369ecd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodea5f3b3-aec6-4220-ade9-184889369ecd.labels" -}}
helm.sh/chart: {{ include "go-echodea5f3b3-aec6-4220-ade9-184889369ecd.chart" . }}
{{ include "go-echodea5f3b3-aec6-4220-ade9-184889369ecd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodea5f3b3-aec6-4220-ade9-184889369ecd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodea5f3b3-aec6-4220-ade9-184889369ecd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}