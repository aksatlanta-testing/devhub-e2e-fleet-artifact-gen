
{{- define "go-echof0475dcd-69d9-4866-bf1a-b09934153eba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof0475dcd-69d9-4866-bf1a-b09934153eba.fullname" -}}
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


{{- define "go-echof0475dcd-69d9-4866-bf1a-b09934153eba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof0475dcd-69d9-4866-bf1a-b09934153eba.labels" -}}
helm.sh/chart: {{ include "go-echof0475dcd-69d9-4866-bf1a-b09934153eba.chart" . }}
{{ include "go-echof0475dcd-69d9-4866-bf1a-b09934153eba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof0475dcd-69d9-4866-bf1a-b09934153eba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof0475dcd-69d9-4866-bf1a-b09934153eba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}