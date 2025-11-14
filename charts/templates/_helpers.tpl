
{{- define "go-echo68c38b2b-cd12-4802-b6b2-3c729bd09cee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo68c38b2b-cd12-4802-b6b2-3c729bd09cee.fullname" -}}
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


{{- define "go-echo68c38b2b-cd12-4802-b6b2-3c729bd09cee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo68c38b2b-cd12-4802-b6b2-3c729bd09cee.labels" -}}
helm.sh/chart: {{ include "go-echo68c38b2b-cd12-4802-b6b2-3c729bd09cee.chart" . }}
{{ include "go-echo68c38b2b-cd12-4802-b6b2-3c729bd09cee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo68c38b2b-cd12-4802-b6b2-3c729bd09cee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo68c38b2b-cd12-4802-b6b2-3c729bd09cee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}