
{{- define "go-echod565ac0e-1aa6-4b48-baf0-f92bff73fd09.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod565ac0e-1aa6-4b48-baf0-f92bff73fd09.fullname" -}}
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


{{- define "go-echod565ac0e-1aa6-4b48-baf0-f92bff73fd09.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod565ac0e-1aa6-4b48-baf0-f92bff73fd09.labels" -}}
helm.sh/chart: {{ include "go-echod565ac0e-1aa6-4b48-baf0-f92bff73fd09.chart" . }}
{{ include "go-echod565ac0e-1aa6-4b48-baf0-f92bff73fd09.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod565ac0e-1aa6-4b48-baf0-f92bff73fd09.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod565ac0e-1aa6-4b48-baf0-f92bff73fd09.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}